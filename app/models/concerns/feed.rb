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
    #
    # There are two different types of distributable lists:
    #
    # 1. Notify (includes all users which will be notified through social relations)
    # 2. Forward (includes additional forwarding of special activities)

    def dispatch(params)

      ## -- Prepare Dispatcher -- ##

      # Generates and add activity id
      params[:id] = Digest::SHA1.hexdigest(params.except(:data, :notify, :forward, :message).to_json).upcase
      # Translate class name to enumeration
      params[:feed] = BaseSlot.slot_types[params[:feed].to_sym]

      ## -- Store Shared Objects (Write-Opt) -- ##

      # Determine target key for redis set
      target_index = "#{params[:feed]}:#{params[:target]}"
      # TODO: Instead of using "Actor" or "Target" as key index it is better to use
      # more qualified namings like: "Slot", "User" or "Group", this will also solve other todos
      if params[:type] == 'User'
        # If target is from type user --> forward target to user shared objects
        $redis.set("Actor:#{params[:object]}", gzip_target(params))
      else
        # Store target to its own index (shared objects)
        $redis.set("Target:#{target_index}", gzip_target(params))
      end
      # Store actor to its own index (shared objects)
      $redis.set("Actor:#{params[:actor]}", gzip_actor(params))

      ## -- Store Current Activity (Write-Opt) -- ##

      # Returns the position of added activity (required for asynchronous access)
      activity_index = $redis.rpush("Feed:#{target_index}", gzip_feed(params)) - 1
      # Determine target index for hybrid "Write-Read-Opt"
      target_key = "#{target_index}:#{activity_index}"

      ## -- Collect Activity Distribution -- ##

      distributor = { User: [], News: [], Notification: [] }
      # Store activity to own feed (me activities)
      distributor[:User] << params[:actor]
      # Send to other users through social relations ("Read-Opt" Strategy)
      distributor[:News] += params[:notify]
      # Store activity to own notification feed (related to own content, filter out own activities)
      distributor[:Notification] << params[:foreign] if params[:foreign] && (params[:actor] != params[:foreign])
      # Add all custom forwardings
      params[:forward].each{ |feed, users| distributor[feed] += users }

      ## -- Distribute Activities (Read-Opt) -- ##

      distribute(target_key, distributor)
    end

    # NOTE: the logic for activity deletion is managed by the corresponding model deletion state.
    # Each call of the models delete method starts triggering activity deletion.
    def remove_from_feed(object, model, target, feed, notify)

      # We using backtracking to improve performance by removing activities through all feeds
      # To backtrack activities from its corresponding target feed it is required to find the index which
      # points to the target feed index, where the related activity is stored
      recursive_index = -1

      # NOTE: Actually all targets are from type Slot to simplify generics
      # TODO: Remove activities where target is not from type Slot (e.g. friend request)
      # Translate class name to enumeration
      target_key = "#{BaseSlot.slot_types[feed.to_sym]}:#{target}"
      # Fetch all activities from target feed (shared feed)
      target_feed_length = $redis.llen("Feed:#{target_key}") - 1

      # Loop through all shared activities to find backtracking index
      # NOTE: This loop may can be skipped by using redis pointers
      (0..target_feed_length).each do |index|
        # Enrich target activity
        activity = enrich_activity(target_key, index)
        # Identify activity
        if ((activity['target'] == target) and (activity['feed'] == feed)) \
        or ((activity['object'] == object) and (activity['model'] == model))
          recursive_index = index
          break
        end
      end

      if recursive_index > -1
        # Loop through all related user feeds through social relations
        notify.each do |user_id|
          %W(Feed:#{user_id}:User
             Feed:#{user_id}:News
             Feed:#{user_id}:Notification).each do |feed_key|
            # Remove activity by object (removes a single activity)
            $redis.lrem(feed_key, 0, "#{target_key}:#{recursive_index}")
          end
        end
      end
    end

    def remove_target_from_feed(target, feed, notify)
      # TODO: remove by target (removes multiple activities)
    end

    def remove_actor_from_feed(actor, notify)
      # TODO: remove by actor (removes multiple activities)
    end

    private def distribute(target_key, distributor)
      # The timestamp is used to validate the feed cache
      current_time = Time.zone.now
      # Distribute to all user feeds (including custom forwardings like friend requests, deletions, etc.)
      distributor.each do |feed, users|
        # Remove foreign user + actor from forwarding to notifications
        # TODO: do not remove here, remove before call
        # users.delete(params[:foreign]) if params[:foreign].present?
        # users.delete(params[:actor])
        # Send to other users ("Read-Opt" Strategy)
        if users.any?
          $redis.pipelined do
            users.uniq.each do |user|
              # Delegate activity to a feed
              $redis.rpush("Feed:#{user}:#{feed}", target_key)
              # Store the feeds update time to revalidate the cache
              $redis.set("Cache:#{user}:#{feed}", current_time)
            end
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

    private def enrich_activity(target_key, index = nil)
      # Split target index into its components
      feed_params = target_key.split(':')
      # Fetch target activity object from index
      target_feed = get_feed_from_index("Feed:#{feed_params[0]}:#{feed_params[1]}", index.nil? ? feed_params[2].to_i : index)
      # Returns the re-builded dictionary (json)
      { type: target_feed[0],
        actor: target_feed[1],
        object: target_feed[2],
        model: target_feed[3],
        target: target_feed[4],
        action: target_feed[5],
        foreign: target_feed[6],
        time: target_feed[7],
        feed: target_feed[8],
        id: target_feed[9]
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
        actor = get_shared_object("Actor:#{activity['actors'].first}")
        # FIX: This is temporary solution for syncing issues on iOS
        # actor = JSONView.user(User.find(activity['actors'].first))
        # Adds the first username and sets usercount to translation params
        i18_params = { USER: actor['username'], USERCOUNT: count }
        # Get target (from shared objects)
        if activity['type'] == 'User'
          # If target is from type user --> load shared object from actor storage
          target = get_shared_object("Actor:#{activity['object']}")
        else
          target = get_shared_object("Target:#{activity['feed']}:#{activity['target']}")
        end
        # FIX: This is temporary solution for syncing issues on iOS
        # target = JSONView.slot(BaseSlot.get(activity['target']))
        # Prepare filtering out private targets from feed + skip (this is an extra check)
        if target['visibility'] == 'private'
          activity['target'] = nil
          next
        end
        # iOs requires the friendshipstate (we use the type of action to determine state)
        # NOTE: the friendship state cannot be stored to shared objects, it is individual!
        case activity['action']
          when 'request'
            actor['friendshipState'] = 'pending passive'
          when 'friendship'
            actor['friendshipState'] = 'friend'
          when 'unfriend'
            actor['friendshipState'] = 'stranger'
        end
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
        i18_key = "#{activity['type'].downcase}_#{activity['action']}_#{view}_#{mode}"
        # Update message params with enriched message
        activity['message'] = I18n.t(i18_key, i18_params)
        # Remove special fields are not used by frontend
        remove_fields_from_activity(activity)
      end
      # Filter out private targets from feed (removed targets from preparation)
      feed.delete_if { |activity| activity['target'].nil? }
      feed
    end

    # NOTE: We can optimize this by aggregating feeds when storing into redis
    # NOTE: Actually we use "live aggregation" instead, so we are able to modify the aggregation logic on the fly
    private def aggregate_feed(feed_index, limit: 25, offset: 0, cursor: nil)
      # Get offset from cursor in reversed logic (LIFO), supports simple offset fallback
      offset = cursor ? cursor.to_i : offset.to_i
      # Temporary holder to store the aggregation feed
      aggregated_feed = []
      # The aggregation group index table
      groups = {}
      # The aggregation targets index table (used for collect activities from same type as the last activity)
      targets = {}
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
        # NOTE: Currently we aggregate only activities which has the same type as the last activity (on the same target)
        # NOTE: Activities vom Reslots cannot be aggregated to its corresponding parent Slot! (this would be result in a merged virtual slot, that not really exist)
        group = post['group'] = "#{post['target']}:#{post['activity']}" ##{post['activity']#{post['time']} #(post['parent'] || post['target'])
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
          # Skip if activity is not from type of the last activity which is related to this target
          next if targets.has_key?(post['target'])
          # Set a switch to the target map, so we can check if an activity of these target was already aggregated
          targets[post['target']] = true
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

    ## Helpers ##

    private def remove_fields_from_activity(activity)
      %w(group object foreign feed).each do |field|
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
          params.except(:data, :message, :notify, :forward).values.to_json
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
