module Feed
  class << self

    def user_feed(user_id, params = {})
      begin
        feed = "Feed:#{user_id}:User"
        page = paginate(feed, params)
        enrich_feed(page, 'me')
      rescue => error
        error_handler(error, feed, params)
      end
    end

    def notification_feed(user_id, params = {})
      begin
        feed = "Feed:#{user_id}:Notification"
        page = paginate(feed, params)
        enrich_feed(page, 'notify')
      rescue => error
        error_handler(error, feed, params)
      end
    end

    def news_feed(user_id, params = {})
      begin
        feed = "Feed:#{user_id}:News"
        page = aggregate_feed(feed, params)
        enrich_feed(page, 'activity')
      rescue => error
        error_handler(error, feed, params)
      end
    end

    # NOTE: the logic for activity deletion is managed by the corresponding model deletion state.
    # Each call of the models delete method starts triggering activity deletion.
    def remove_from_feed(object, target, actor, notify)
      # Prepare local vars
      target_id = target.id.to_s
      object_id = object.id.to_s
      object_class = object.class.name
      # Loop through all related feeds
      # Add current user to the notification array
      (notify.as_json << actor.id.to_s).each do |user_id|
        ["Feed:#{user_id}:User",
         "Feed:#{user_id}:News",
         "Feed:#{user_id}:Notification"].each do |feed_key|
          # Fetch all target activities
          feed = $redis.lrange(feed_key, 0, -1)
          # Loop through all activities
          feed.each do |post|
            # Enrich target activity
            target_feed = enrich_activity(post)
            # Remove activity
            if (target_feed['target'] == target_id) or ((target_feed['object'] == object_id) and (target_feed['class'] == object_class))
              $redis.lrem(feed_key, 0, post)
            end
          end
        end
      end
    end

    # Feed Dispatcher
    #
    # The activities will be distributed to the related feeds
    # through social relations and also handle different type of feeds:
    #
    # 1. User Feed (takes all "me activities" where actor is the current user)
    # 2. Public Feed (activities from friends, groups, reslots, followings),
    #    own activities are not included here as well as activities
    #    related to the current users content
    # 3. Notification Feed (takes all activities which are related to the users content),
    #    own activities are not included here

    def dispatch(params)
      # Generates and add activity id (full params are used here)
      params[:id] = Digest::SHA1.hexdigest(params.except(:data, :notify, :message).to_json).upcase
      # Translate class name to enumeration
      params[:feed] = BaseSlot.slot_types[params[:feed].to_sym]

      # Determine target key for redis set
      target_index = "#{params[:feed]}:#{params[:target]}"
      # Store target to its own index (shared objects)
      $redis.set("Target:#{target_index}", gzip_target(params))
      # Store actor to its own index (shared objects)
      $redis.set("Actor:#{params[:actor]}", gzip_actor(params))

      # Store activity to targets feed (used for "Write-Opt" Strategy)
      # Returns the position of added activity (required for asynchronous access)
      activity_index = $redis.rpush("Feed:#{target_index}", gzip_feed(params)) - 1
      # Determine target index for hybrid "Write-Read-Opt"
      target_key = "#{target_index}:#{activity_index}"

      # Store activity to own feed (me activities)
      $redis.rpush("Feed:#{params[:actor]}:User", target_key)
      # Store activity to own notification feed (related to own content, filter out own activities)
      $redis.rpush("Feed:#{params[:foreign]}:Notification", target_key) if params[:foreign] && (params[:actor] != params[:foreign])

      # Send to other users through social relations ("Read-Opt" Strategy)
      unless params[:notify].empty?
        $redis.pipelined do
          params[:notify].each do |user|
            # Store to others public activity feed
            $redis.rpush("Feed:#{user}:News", target_key)
          end
        end
      end
    end

    private def paginate(feed_index, limit: 25, offset: 0, cursor: nil)
      # Get offset in reversed logic (LIFO), supports simple cursor fallback
      offset = cursor ? cursor.to_i : offset.to_i
      # Catch MIN as MAX in reversed order
      min = [offset + limit.to_i, $redis.llen("Feed:#{feed_index}") - 1].min
      # NOTE: Feeds are retrieved in reversed order to apply LIFO (=> reversed logic)
      feed = $redis.lrange(feed_index, offset, min).reverse!
      # Enrich target activities
      feed.map{ |a| enrich_activity(a) }
    end

    private def enrich_activity(target_key)
      # Split target index into its components
      feed_params = target_key.split(':')
      # Fetch target activity object from index
      target_feed = get_feed_from_index("Feed:#{feed_params[0]}:#{feed_params[1]}", feed_params[2].to_i)
      # Returns the re-builded dictionary (json)
      {
          type: target_feed[0],
          actor: target_feed[1],
          object: target_feed[2],
          target: target_feed[3],
          activity: target_feed[4],
          foreign: target_feed[5],
          parent: target_feed[6],
          time: target_feed[7],
          feed: target_feed[8],
          class: target_feed[9],
          id: target_feed[10]
      }.as_json
    end

    private def enrich_feed(feed, view)
      feed.each do |activity|
        # Set single actors to array to simplify enrichment process
        activity['actors'] ||= [activity['actor'].to_i] if activity['actor']
        count = activity['actors'].count
        # In handy we remove the single field 'actor' on aggregated feeds
        activity.delete('actor')
        # Determine translation params
        # Get the first actor (from shared objects)
        # actor = get_shared_object("Actor:#{activity['actors'].first}")
        # NOTE: This is temporary solution for syncing issues on iOS
        actor = JSONView.user(User.find(activity['actors'].first))
        # Adds the first username and sets usercount to translation params
        i18_params = { USER: actor['username'], USERCOUNT: count }
        # Get target (from shared objects)
        # target = get_shared_object("Target:#{activity['feed']}:#{activity['target']}")
        # NOTE: This is temporary solution for syncing issues on iOS
        target = JSONView.slot(BaseSlot.get(activity['target']))
        # Prepare filtering out private targets from feed + skip (this is an extra check)
        activity.delete('target') and next if target['visibility'] == 'private'
        # Enrich with custom activity data (shared objects)
        activity['data'] = { target: target, actor: actor }
        # Add the title to the translation params holder
        i18_params[:TITLE] = (target['title'] || target['name']) if target['title'] || target['name']
        # Collect further usernames for aggregated messages (actual we need 2 at maximum)
        if count > 1
          # Get second actor (from shared objects)
          actor = get_shared_object("Actor:#{activity['actors'].second}")
          # Add the second username to the translation params holder
          i18_params[:USER2] = actor['username']
        end
        # Determine pluralization
        mode = count > 2 ? 'aggregate' : (count > 1 ? 'plural' : 'singular')
        # Determine translation key
        i18_key = "#{activity['type'].downcase}_#{activity['activity']}_#{view}_#{mode}"
        # Update message params with enriched message
        activity['message'] = I18n.t(i18_key, i18_params)
        # Remove special fields are not used by frontend
        remove_fields_from_activity(activity)
      end
      # Filter out private targets from feed (removed targets from preparation)
      feed.delete_if { |activity| activity['target'].nil? }
      feed
    end

    # TODO: We can optimize this by aggregating feeds when storing into redis
    # NOTE: If we use "live aggregation" we are able to modify
    # the aggregation logic on the fly
    private def aggregate_feed(feed_index, limit: 25, offset: 0, cursor: nil)
      # Get offset from cursor in reversed logic (LIFO), supports simple offset fallback
      offset = cursor ? cursor.to_i : offset.to_i
      # Temporary holder to store the aggregation feed
      aggregated_feed = []
      # The aggregation group index table
      groups = {}
      # The index of the group index table
      index = -1
      # To determine the paging cursor we use a counter
      # Also we use this counter to check on break condition if limit is reached
      count = 0
      # NOTE: Feeds are retrieved in reversed order to apply LIFO (=> reversed logic)
      feed = $redis.lrange(feed_index, 0, $redis.llen("Feed:#{feed_index}") - offset - 1).reverse!
      # Loop through all feeds (has a break statement, offset is optional)
      feed.each do |post|
        # Enrich target activity
        post = enrich_activity(post)
        # Generates group tag (acts as the aggregation index)
        # NOTE: Currently we aggregate only to the last of all activities of the same target
        # NOTE: Activities vom ReSlots will be aggregated to its corresponding parent Slot
        group = post['group'] = "#{post['target']}}" ##{post['activity']#{post['time']} #(post['parent'] || post['target'])
        # Get activity actor
        actor = post['actor'].to_i
        # If group exist on this page then aggregate to this group
        if groups.has_key?(group)
          # Determine current aggregation group index
          current = groups[group]
          # Get current aggregation group feed
          current_feed = aggregated_feed[current]
          # Update activity count
          current_feed['activityCount'] += 1
          # Collect actors as unique
          current_feed['actors'] << actor unless current_feed['actors'].include?(actor)
          # Skip counting for cursor and limits
          next
        # If group does not exist, creates a new group for aggregations
        elsif count < limit.to_i
          # Increment index on each new group (starting from -1)
          current = groups[group] = (index += 1)
          # Set the whole activity object on each new group
          # which takes the last state of all activities
          current_feed = aggregated_feed[current] = post
          # We create a new array-field 'actors' on each
          # new group and add current actor to it
          current_feed['actors'] = [actor]
          # Init activity counter
          current_feed['activityCount'] = 1
          # Sets a generated feed id to prevent id conflicts with other activity views
          current_feed['id'] = Digest::SHA1.hexdigest(group).upcase
        else
          # Breaks the aggregation process if limit is reached
          break
        end
        # Set or update current feed next cursor (if the limit isn't reached)
        current_feed['cursor'] = ((count += 1) + offset).to_s
      end
      aggregated_feed
    end

    private def remove_fields_from_activity(activity)
      %w(parent class object foreign feed).each do |field|
        activity.delete(field)
      end
      activity
    end

    private def get_shared_object(feed_index)
      JSON.parse(
        ActiveSupport::Gzip.decompress(
          $redis.get(feed_index)
      ))
    end

    private def get_feed_from_index(key, index)
      JSON.parse(
        ActiveSupport::Gzip.decompress(
          $redis.lindex(key, index)
      ))
    end

    private def gzip_feed(params)
      ActiveSupport::Gzip.compress(
          params.except(:data, :message, :notify).values.to_json
      )
    end

    private def gzip_actor(params)
      ActiveSupport::Gzip.compress(
          params[:data][:actor].to_json
      )
    end

    private def gzip_target(params)
      ActiveSupport::Gzip.compress(
          params[:data][:target].to_json
      )
    end

    private def error_handler(error, feed, params)
      opts = {}
      opts[:parameters] = {
          feed: feed,
          params: params
      }
      Rails.logger.error { error }
      Airbrake.notify(error, opts)
    end
  end
end
