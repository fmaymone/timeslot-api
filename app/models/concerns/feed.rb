module Feed

  @storage = RedisStorage

  class << self

    def user_feed(user, params = {})
      feed = "Feed:#{user}:User"
      cache = get_from_cache(feed, params)
      return cache if cache
      page = paginate(feed, params)
      result = enrich_feed(page, 'me')
      set_to_cache(feed, params, result)
    rescue => error
      error_handler(error, feed, params)
    end

    def notification_feed(user, params = {})
      feed = "Feed:#{user}:Notification"
      cache = get_from_cache(feed, params)
      return cache if cache
      page = paginate(feed, params)
      result = enrich_feed(page, 'notify')
      set_to_cache(feed, params, result)
    rescue => error
      error_handler(error, feed, params)
    end

    def news_feed(user, params = {}, context = nil)
      feed = "Feed:#{user}:News"
      params.merge!(context: context) if context
      cache = get_from_cache(feed, params)
      return cache if cache
      page = aggregate_feed(feed, params)
      result = enrich_feed(page, 'activity')
      set_to_cache(feed, params, result)
    rescue => error
      error_handler(error, feed, params)
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
    # 2. Forward (includes additional forwardings to specific user feeds)

    def dispatch(params)

      # Generates and add activity id
      params[:id] = Digest::SHA1.hexdigest(params.except(:data, :notify, :forward, :message).to_json).upcase

      ## -- Store Shared Objects (Write-Opt) -- ##

      # Store target to its own index (shared objects)
      # NOTE: Targets are generic and can have different types (e.g. Slot, User, Group)
      @storage.set("#{params[:type]}:#{params[:target]}", gzip_data_field(params, :target))
      # Store actor to its own index (shared objects)
      @storage.set("User:#{params[:actor]}", gzip_data_field(params, :actor))

      ## -- Store Current Activity (Write-Opt) -- ##

      # Determine target key for redis set
      target_index = "#{params[:type]}:#{params[:target]}"
      # Returns the position of added activity (required for asynchronous access)
      activity_index = @storage.push("Feed:#{target_index}", gzip_feed(params)) - 1
      # Determine target index for hybrid "Write-Read-Opt"
      target_key = "#{target_index}:#{activity_index}"

      ## -- Collect Activity Distribution -- ##

      feed_register = { User: [], News: [], Notification: [] }

      # Skip default distribution if fowardings was passed
      if params[:forward].empty?
        # Store activity to own feed (me activities)
        feed_register[:User] << params[:actor]
        # Send to other users through social relations ("Read-Opt" Strategy)
        feed_register[:News] += params[:notify]
        # Store activity to own notification feed (related to own content, filter out own activities)
        feed_register[:Notification] << params[:foreign] if params[:foreign].present? && (params[:actor] != params[:foreign])
      else
        # Add all custom forwardings
        params[:forward].each{ |index, users| feed_register[index] += users }
      end

      ## -- Distribute Activities (Read-Opt) -- ##

      distribute(target_key, feed_register)
    end

    # We using backtracking to improve performance by removing activities through all feeds
    # To backtrack activities from its corresponding target feed it is required to find the index which
    # points to the target feed index, where the related activity is stored

    def remove_item_from_feed(object:, model:, target:, type:, notify:)
      target_key = "#{type}:#{target}"
      # Fetch all activities from target feed (shared feed)
      target_feed = @storage.range("Feed:#{target_key}", 0, -1)
      # Loop through all shared activities to find backtracking index
      # NOTE: This loop may can be skipped by using real redis pointers
      target_feed.each_with_index do |activity, index|
        # Enrich target activity (to access original activity data)
        activity = enrich_activity_struct(unzip_json(activity))
        # Identify single activity
        if (activity['object'] == object) && (activity['model'] == model)
          # Loop through all related user feeds through social relations
          remove_activity_from_feed("#{target_key}:#{index}", Time.now.to_f, notify)
          break
        end
      end
    end

    def remove_target_from_feeds(target:, type:, notify:)
      target_key = "#{type}:#{target}"
      # Fetch all activities from target feed (shared feed)
      target_feed_length = @storage.length("Feed:#{target_key}") - 1
      # The timestamp is used to validate the feed cache
      current = Time.now.to_f
      # Loop through all target activities via backtracking
      (0..target_feed_length).each do |index|
        # We do not delete the activity source, instead we remove the pointers to
        # this activity which was distributed to the users feeds
        remove_activity_from_feed("#{target_key}:#{index}", current, notify)
      end
    end

    def remove_user_from_feeds(user:, notify:)
      # NOTE: For this step we need to fetch all objects related to target feeds
      targets = user.std_slots
                # user.re_slots
                # user.group_slots
                #user.friendships +
                #user.memberships

      # We collect job data here and pass this into the removal job worker
      job_data = []

      targets.each do |target|
        # Try to extend social context for each target
        context = target.try(:followers)
        context.merge!(notify).uniq if context
        # Collect job data (remove by target)
        job_data << { target: target.id,
                      type: target.activity_type,
                      notify: context || notify }
      end
      job_data
    end

    private def remove_activity_from_feed(feed_key, time, notify)
      @storage.pipe do
        # Loop through all related user feeds through social relations
        notify.each do |user_id|
          %W(Feed:#{user_id}:User
             Feed:#{user_id}:News
             Feed:#{user_id}:Notification).each do |feed_index|
            # Remove activity by object (removes a single pointer to an activity)
            @storage.remove_all(feed_index, feed_key)
            # Store the feeds update time to force re-validation of the cache
            @storage.set("Update:#{feed_index}", time)
          end
        end
      end
    end

    private def distribute(target_key, distributor)
      # The timestamp is used to validate the feed cache
      current_time = Time.now.to_f
      # Distribute to all user feeds (including custom forwardings like friend requests, deletions, etc.)
      distributor.each do |index, users|
        # Send to other users ("Read-Opt" Strategy)
        if users.any?
          @storage.pipe do
            users.uniq.each do |user|
              feed_index = "Feed:#{user}:#{index}"
              # Delegate activity to a feed
              @storage.push(feed_index, target_key)
              # Store the feeds update time to force re-validation of the cache
              @storage.set("Update:#{feed_index}", current_time)
            end
          end
        end
      end
    end

    private def paginate(feed_index, limit: 25, offset: 0, cursor: nil)
      # Get offset in reversed logic (LIFO), supports simple cursor fallback
      offset = cursor ? cursor.to_i : offset.to_i
      # Catch MIN as MAX in reversed order
      min = [offset + limit.to_i, @storage.length("Feed:#{feed_index}") - 1].min
      # NOTE: Feeds are retrieved in reversed order to apply LIFO (=> reversed logic)
      feed = @storage.range(feed_index, offset, min).reverse!
      # Enrich target activities
      feed.map{ |a| enrich_activity(a) }
    end

    private def enrich_activity(target_key, index = nil)
      # Split target index into its components
      feed_params = target_key.split(':')
      # Fetch target activity object from index
      target_feed = get_feed_from_index("Feed:#{feed_params[0]}:#{feed_params[1]}", index || feed_params[2].to_i)
      # Returns the enriched activity as a dictionary (json)
      enrich_activity_struct(target_feed)
    end

    private def enrich_activity_struct(feed)
      { type: feed[0],
        actor: feed[1],
        object: feed[2],
        model: feed[3],
        target: feed[4],
        action: feed[5],
        foreign: feed[6],
        time: feed[7],
        id: feed[8]
      }.as_json
    end

    private def enrich_feed(feed, view)
      feed.each do |activity|
        # Set single actors to array to simplify enrichment process
        activity['actors'] ||= [activity['actor'].to_i] if activity['actor']
        # In handy we remove the single field 'actor' on aggregated feeds
        activity.delete('actor')
        # Get the first actor (from shared objects)
        actor = get_shared_object("User:#{activity['actors'].first}")
        # Get target (from shared object)
        target = get_shared_object("#{activity['type']}:#{activity['target']}")

        # FIX: This is temporary solution for syncing issues on iOS
        # actor = JSONView.user(User.find(activity['actors'].first))
        # target = JSONView.slot(BaseSlot.get(activity['target']))

        # Prepare filtering out private targets from feed + skip (this is an extra check)
        if target.try(:visibility) == 'private'
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
            # FIX: delegate second user if friendship was accepted
            activity['actors'] << activity['target'].to_i
          when 'unfriend'
            actor['friendshipState'] = 'stranger'
        end

        # Update message params with enriched message
        activity['message'] = enrich_message(activity, actor, target, view) || ''
        # Enrich with custom activity data (shared objects)
        activity['data'] = { target: target, actor: actor }
        # Remove special fields are not used by frontend
        remove_fields_from_activity(activity)
      end
      # Filter out private targets from feed (removed targets from preparation)
      feed.delete_if { |activity| activity['target'].nil? || activity['message'].blank? }
      feed
    end

    private def enrich_message(activity, actor, target, view)
      actor_count = activity['actors'].count
      # Adds the first username and sets usercount to translation params
      i18_params = { USER: actor['username'], USERCOUNT: actor_count }
      # TODO:
      # Add the targets field to the translation params holder
      i18_params[:FIELD] = 'title'
      # Add the title to the translation params holder
      i18_params[:TITLE] = (target['title'] || target['name']) if target && (target['title'] || target['name'])
      # Collect further usernames for aggregated messages (actual we need 2 at maximum)
      if actor_count > 1
        # Get second actor (from shared objects)
        actor = get_shared_object("User:#{activity['actors'].second}")
        # Add the second username to the translation params holder
        i18_params[:USER2] = actor['username']
      elsif activity['foreign'].present?
        # Get second actor (from shared objects)
        actor = get_shared_object("User:#{activity['foreign']}")
        # Add the second username to the translation params holder
        i18_params[:USER2] = actor['username'].presence if actor
      end
      # Determine pluralization
      mode = actor_count > 2 ? 'aggregate' : (actor_count > 1 ? 'plural' : 'singular')
      # Determine translation key
      i18_key = "#{activity['type'].downcase}_#{activity['action']}_#{view}_#{mode}"
      # Returns the message from translation index
      I18n.t(i18_key, i18_params)
    end

    # NOTE: We can optimize this by aggregating feeds when storing into redis
    # NOTE: Actually we use "live aggregation" instead, so we are able to modify the aggregation logic on the fly
    private def aggregate_feed(feed_index, limit: 25, offset: 0, cursor: nil, context: nil)
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
      feed_count = 0
      # NOTE: Feeds are retrieved in reversed order to apply LIFO (=> reversed logic)
      feed = @storage.range(feed_index, 0, @storage.length("Feed:#{feed_index}") - offset - 1).reverse!
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
          # Get intersection of actors and the users social context
          current_feed['actors'] &= context if context
          # Skip counting for cursor and limits
          next
        # If group does not exist, creates a new group for aggregations
        elsif feed_count < limit.to_i
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
        current_feed['cursor'] = ((feed_count += 1) + offset).to_s
      end
      aggregated_feed
    end

    ## Cache Helpers ##

    private def get_from_cache(feed, params)
      # Determine when the last feed update was happened
      last_update = @storage.get("Update:#{feed}")
      # Get the current cache state
      last_state = @storage.get("Status:#{feed}")
      # Validated the cache state
      if validate_cache(last_update, last_state)
        last_cache = get_cached_feed(feed)
        cache_index = generate_index(params)
        last_cache[cache_index] if last_cache
      else
        nil
      end
    end

    private def set_to_cache(feed, params, result)
      # Determine when the last feed update was happened
      last_update = @storage.get("Update:#{feed}")
      # Set initially timer if there are no actions
      if last_update.nil?
        last_update = Time.now.to_f
        @storage.set("Update:#{feed}", last_update)
      end
      # Set the current cache state
      @storage.set("Status:#{feed}", last_update)
      # Update cache
      last_cache = get_cached_feed(feed) || {}
      cache_index = generate_index(params)
      last_cache[cache_index] = result
      @storage.set("Cache:#{feed}", gzip_cache(last_cache))
      result
    end

    private def validate_cache(last_update, last_state)
      last_update.present? &&
      last_state.present? &&
      last_update == last_state &&
      # FIX: Force refresh when last update is too close to the current request
      Time.now.to_f - last_update.to_f >= 1.0 # time in seconds (float)
    end

    ## Helpers ##

    private def remove_fields_from_activity(activity)
      %w(group object foreign model).each do |field|
        activity.delete(field)
      end
      activity
    end

    private def get_shared_object(feed_index)
      obj = @storage.get(feed_index)
      obj ? unzip_json(obj) : nil
    end

    private def get_feed_from_index(key, index)
      unzip_json(@storage.index(key, index))
    end

    private def generate_index(params)
      Digest::MD5.hexdigest(params.to_json).upcase
    end

    private def get_cached_feed(feed_index)
      cache = @storage.get("Cache:#{feed_index}")
      cache ? unzip_json(cache) : nil
    end

    private def gzip_cache(cache)
      ActiveSupport::Gzip.compress(
          cache.to_json
      )
    end

    private def gzip_feed(params)
      ActiveSupport::Gzip.compress(
          params.except(:data, :message, :notify, :forward).values.to_json
      )
    end

    private def gzip_data_field(params, field)
      ActiveSupport::Gzip.compress(
          params[:data][field].to_json
      )
    end

    private def unzip_json(json)
      JSON.parse(
        ActiveSupport::Gzip.decompress(
          json
      ))
    end

    private def error_handler(error, feed, params)
      Rails.logger.error { error }
      Airbrake.notify(error, feed: feed, params: params)
    end
  end
end
