module Feed

  @storage = RedisStorage

  class << self

    def user_feed(user, params = {})
      feed = "Feed:#{user}:User"
      cache = get_from_cache(feed, params)
      return cache if cache
      page = paginate(feed, params)
      result = enrich_feed(page, 'me', user)
      set_to_cache(feed, params, result)
    rescue => error
      error_handler(error, feed, params)
    end

    def notification_feed(user, params = {})
      feed = "Feed:#{user}:Notification"
      cache = get_from_cache(feed, params)
      return cache if cache
      page = paginate(feed, params)
      result = enrich_feed(page, 'notify', user)
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
      result = enrich_feed(page, 'activity', user)
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

    def dispatch(params)
      # Generate and add activity id
      params[:id] = Digest::SHA1.hexdigest(params.except(:data, :forward).to_json).upcase
      # Determine target key for redis set
      target_index = "#{params[:type]}:#{params[:target]}"

      ## -- Store Shared Objects (Write-Opt) -- ##

      # Store activity to context-based feed index (shared activity)
      # NOTE: Targets are generic and can have different types (e.g. Slot, User, Group)
      @storage.set(target_index, gzip_json(params[:data][:target]))
      # Store actor to its own index (shared objects)
      @storage.set("User:#{params[:actor]}", gzip_json(params[:data][:actor]))
      # Store foreign user to its own index (shared objects)
      @storage.set("User:#{params[:foreign]}", gzip_json(params[:data][:foreign])) if params[:foreign].present?

      ## -- Store social context to the activity object (Delete-Opt) -- ##

      @storage.push("Context:#{target_index}", params[:forward].values.to_json)

      ## -- Store Current Activity to context-based feeds (Write-Opt) -- ##

      # Returns the position of added activity (required for asynchronous access)
      activity_index = @storage.push("Feed:#{target_index}", gzip_feed(params)) - 1
      # Determine target index for hybrid "Write-Read-Opt"
      target_key = "#{target_index}:#{activity_index}"

      ## -- Distribute Activities (Read-Opt) -- ##

      distribute(target_key, forwarding: params[:forward])
    end

    # We using backtracking to improve performance by removing activities through all feeds
    # To backtrack activities from its corresponding target feed it is required to find the index which
    # points to the target feed index, where the associated activity is stored

    # Removes a specific activity from the recipients feeds (e.g. remove a like)
    def remove_activity(target:, type:, object:, model:, forward: nil)
      count = {}
      removed_recipients = []
      target_key = "#{type}:#{target}"
      # Fetch all activities from target feed (shared feed)
      target_feed = @storage.range("Feed:#{target_key}", 0, -1)
      # Fetch distributed context from target feed (shared feed)
      context = @storage.range("Context:#{target_key}")
      # Loop through all shared activities to find backtracking index
      # NOTE: This loop may can be skipped by using real redis pointers
      target_feed.each_with_index do |activity, index|
        # Skip already deleted activities
        next if context[index] == ''
        # Enrich target activity (to access original activity data)
        activity = enrich_activity_struct(unzip_json(activity))
        # Identify single activity
        if (activity['object'] == object) && (activity['model'] == model)
          # Add distributed context to the recipients
          recipients = forward || JSON.parse(context[index])
          removed_recipients += recipients.flatten
          # Deletes old activity pointer (keep index)
          @storage.set_to_index("Feed:#{target_key}", index, nil)
          @storage.set_to_index("Context:#{target_key}", index, nil)
          # Loop through all related user feeds through social relations
          remove_activity_from_feed("#{target_key}:#{index}", Time.now.to_f, recipients)
          # Break loop when activity was found
          # NOTE: still repeat on combined activities (actually when a friendship was accepted)
          # NOTE: the action friendship was set first, so we can also skip when the combined activity 'accept' occures
          break unless activity['action'] == 'friendship' # || activity['action'] == 'accept'
        end
      end
      removed_recipients.uniq!
      removed_recipients
    end

    # TODO: improve
    # Removes a target from the recipients feeds (e.g. remove all activities related to a slot)
    def remove_target(target:, type:)
      removed_recipients = []
      target_key = "#{type}:#{target}"
      # Fetch all activities from target feed (shared feed)
      feed_length = @storage.length("Feed:#{target_key}") - 1
      # Fetch distributed context from target feed (shared feed)
      context = @storage.range("Context:#{target_key}")
      # The timestamp is used to validate the feed cache
      current_time = Time.now.to_f
      # Loop through all target activities stored in the target feed
      (0..feed_length).each do |index|
        # Skip already deleted activities
        next if context[index] == ''
        # Enrich target activity (to access original activity data)
        activity = enrich_activity_struct(unzip_json(@storage.index("Feed:#{target_key}", index)))
        # TODO: improve by using a hybrid model
        # Re-perform activity within the original context to get current distributions
        model = activity['model'].constantize.find(activity['object'].to_i)
        model.initiator = User.find(activity['actor'].to_i) if model.respond_to?(:initiator)

        # Determine activity context
        preserve = model.activity_context(activity['action'])
        recipients = JSON.parse(context[index])

        # FIX: Creator can always see activities to own content
        if (activity['model'] == 'Slot' && model.creator.id.to_s == activity['foreign']) ||
           (activity['model'] == 'Group' && model.owner.id.to_s == activity['foreign'])
          preserve.map!{|a| a << activity['foreign']}
        end

        # Add distributed context to the recipients
        recipients.map!.with_index{|a,i| a - preserve[i]}
        removed_recipients += recipients.flatten

        # We do not delete the activity source, instead we remove the pointers to
        # this activity which was distributed to the users feeds
        remove_activity_from_feed("#{target_key}:#{index}", current_time, recipients)

        # Update state of actual distributed context
        if preserve.any?
          @storage.set_to_index("Context:#{target_key}", index, preserve.to_json)
        else
          # Deletes old activity pointer (keep index)
          @storage.set_to_index("Feed:#{target_key}", index, nil)
          @storage.set_to_index("Context:#{target_key}", index, nil)
        end
      end
      removed_recipients.uniq!
      removed_recipients
    end

    # TODO: improve
    def remove_user(user)
      # Remove all distributed activities where the current user was actor
      Like.where(user: user).find_each(&:remove_activity)
      Comment.where(user: user).find_each(&:remove_activity)
      MediaItem.where(creator: user).find_each(&:remove_activity)
      Note.where(creator: user).find_each(&:remove_activity)
      Group.where(owner: user).find_each(&:remove_activity)

      # Remove all distributed activities where the current user was creator/owner
      BaseSlot.joins(:meta_slot).where('creator_id = ?', user.id).find_each do |slot|
        slot.containerships.each(&:remove_activity)
        slot.passengerships.each(&:remove_activity)
        slot.likes.each(&:remove_activity)
        slot.comments.each(&:remove_activity)
        slot.media_items.each(&:remove_activity)
        slot.notes.each(&:remove_activity)
        slot.remove_activity
      end
    end

    # TODO: improve
    def remove_friends(users)
      users = [users] unless users.kind_of?(Array)
      users.each do |user|
        # Remove all distributed activities where the current user was actor
        Like.where(user: user).each(&:reduce_distribution_by)
        Comment.where(user: user).each(&:reduce_distribution_by)
        MediaItem.where(creator: user).each(&:reduce_distribution_by)
        Note.where(creator: user).each(&:reduce_distribution_by)
        Group.where(owner: user).each(&:reduce_distribution_by)

        # Remove all distributed activities where the current user was creator/owner
        user.std_slots.each(&:reduce_distribution_by)
        user.passengerships.each(&:reduce_distribution_by)
        user.memberships.each(&:reduce_distribution_by)
        user.friendships.each(&:reduce_distribution_by)
      end
    end

    # TODO: improve
    def update_objects(objects)
      objects = [objects] unless objects.kind_of?(Array)
      user_feeds = []

      objects.each do |object|
        json = render_shared_object(object)
        activity_type = object.class.name
        # Normalize slot type
        %w(StdSlotPrivate StdSlotFriends StdSlotPublic StdSlotFoaf GlobalSlot StdSlot).each do |replace|
          activity_type.gsub!(replace, 'Slot')
        end
        # Update object data
        @storage.set("#{activity_type}:#{object.id}", gzip_json(json)) if json

        # Collect followers to update involved feeds
        user_feeds += object.followers
        case activity_type
        when 'Slot'
          user_feeds << object.creator.id
        when 'Group'
          user_feeds << object.owner.id
        when 'User'
          user_feeds << object.id
        end
      end

      user_feeds.uniq!
      refresh_cache(user_feeds)
    end

    # TODO: improve
    def refresh_cache(user_ids, time = Time.now.to_f)
      user_ids = [user_ids] unless user_ids.kind_of?(Array)

      @storage.pipe do
        user_ids.each do |user_id|
          %W(Feed:#{user_id}:News
             Feed:#{user_id}:User
             Feed:#{user_id}:Notification).each do |feed_index|
            @storage.set("Update:#{feed_index}", time)
          end
        end
      end
    end

    def render_shared_object(object)
      return nil unless object.present?
      case object.class.name
      when 'StdSlotPrivate', 'StdSlotFriends', 'StdSlotPublic', 'StdSlotFoaf', 'GlobalSlot', 'StdSlot'
        json = JSON.parse(ApplicationController.new.render_to_string(
            template: 'v1/slots/_slot',
            layout: false,
            locals: {
                :slot => object,
                :current_user => object.creator
            }
        ))
      when 'Group'
        json = JSON.parse(ApplicationController.new.render_to_string(
            template: 'v1/groups/_group',
            layout: false,
            locals: {
                :group => object,
                :current_user => object.owner
            }
        ))
      when 'User'
        json = JSON.parse(ApplicationController.new.render_to_string(
            template: 'v1/users/_user',
            layout: false,
            locals: {
                :user => object
            }
        ))
      else
        json = nil
      end
      json
    end

    private def remove_activity_from_feed(activity, time, recipients)
      Async.new(db: false) do
        @storage.pipe do
          # Loop through all related user feeds through social relations
          %w(User News Notification).each_with_index do |feed, index|
            recipients[index].each do |user_id|
              feed_index = "Feed:#{user_id}:#{feed}"
              # Remove activity by object (removes a single pointer to an activity)
              @storage.remove_all(feed_index, activity)
              # Store the feeds update time to force re-validation of the cache
              @storage.set("Update:#{feed_index}", time)
            end
          end
        end
      end
    end

    private def distribute(target_key, forwarding:)
      # The timestamp is used to validate the feed cache
      current_time = Time.now.to_f
      # Distribute to all user feeds (including custom forwardings like friend requests, deletions, etc.)
      forwarding.each do |index, user_ids|
        # Send to other users ("Read-Opt" Strategy)
        if user_ids.any?
          Async.new(db: false) do
            @storage.pipe do
              user_ids.each do |user_id|
                feed_index = "Feed:#{user_id}:#{index}"
                # Delegate activity to a feed
                @storage.push(feed_index, target_key)
                # Store the feeds update time to force re-validation of the cache
                @storage.set("Update:#{feed_index}", current_time)
              end
            end
          end
        end
      end
    end

    private def paginate(feed_index, limit: 25, offset: 0, cursor: nil)
      length = @storage.length(feed_index)
      # Get offset in reversed logic (LIFO), supports simple cursor fallback
      offset = cursor ? cursor.to_i : offset.to_i
      # Determine start in reversed order
      start = [length - offset - limit.to_i, 0].max
      start = length if offset >= length
      # Determine range in reversed order
      range = [start + limit.to_i - 1, length - offset - 1].min
      # NOTE: Feeds are retrieved in reversed order to apply LIFO (=> reversed logic)
      feed = @storage.range(feed_index, start, range).reverse!
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
        time: Time.at(feed[7]),
        id: feed[8]
      }.as_json
    end

    private def enrich_feed(feed, view, viewer)
      feed.each do |activity|
        # Set single actors to array to simplify enrichment process
        activity['actors'] ||= [activity['actor'].to_i] if activity['actor']
        # In handy we remove the single field 'actor' on aggregated feeds
        activity.delete('actor')
        # Get the first actor (from shared objects)
        actor = get_shared_object("User:#{activity['actors'].first}")
        # Get target (from shared object)
        target = get_shared_object("#{activity['type']}:#{activity['target']}")

        # Prepare filtering out private targets from feed + skip (this is an extra check)
        # if target.try(:visibility) == 'private'
        #   activity['target'] = nil
        #   next
        # end

        # Add individual data related to each users feed:
        # iOs requires the friendshipstate (we use the type of action to determine bi-directional state)
        # NOTE: the friendship state cannot be stored to shared objects, it is individual!
        case activity['action']
        when 'request'
          actor['friendshipState'] = 'pending passive'
          target['friendshipState'] = 'pending active'
        when 'friendship', 'accept'
          actor['friendshipState'] = 'friend'
          target['friendshipState'] = 'friend'
        when 'unfriend'
          actor['friendshipState'] = 'stranger'
          target['friendshipState'] = 'stranger'
        end

        # Update message params with enriched message
        activity['message'] = enrich_message(activity, actor, target, view, viewer) || ''
        # Enrich with custom activity data (shared objects)
        activity['data'] = { target: target, actor: actor }
        # Remove special fields are not used by frontend
        activity.except!(:group, :object, :model)
      end
      # Filter out private targets from feed (removed targets from preparation)
      feed.delete_if { |activity| activity['message'].blank? } # activity['target'].nil? ||
      feed
    end

    private def enrich_message(activity, actor, target, view, viewer)
      actor_count = activity['actors'].count

      # Collect further usernames for aggregated messages (actual we need 2 at maximum)
      if actor_count > 1
        # Get second actor (from shared objects)
        target_user = get_shared_object("User:#{activity['actors'].second}")
      elsif activity['foreign'].present?
        # Get second actor (from shared objects)
        target_user = get_shared_object("User:#{activity['foreign']}")
      elsif activity['type'] == 'User'
        # Get target user (from shared objects)
        target_user = get_shared_object("User:#{activity['target']}")
      else
        target_user = nil
      end

      # Adds the first username and sets usercount to translation params
      # FIX: decrease usercount by one if greater than 2 (e.g. 'User1 and 2 others ...')
      i18_params = { ACTOR: actor['username'], COUNT: actor_count > 2 ? actor_count - 1 : actor_count }
      # Add the targets field to the translation params holder (actually not in use)
      #i18_params[:FIELD] = 'title'
      # Add the title to the translation params holder
      i18_params[:TITLE] = target['title'] if target && target['title']
      # Add the name to the translation params holder
      i18_params[:NAME] = target['name'] if target && target['name']
      # Add the target username to the translation params holder
      i18_params[:USER] = target_user['username'] if target_user

      # Determine pluralization
      mode = actor_count > 2 ? 'aggregate' : (actor_count > 1 ? 'plural' : 'singular')

      # Determine translation key (personalized to the current user/viewer)
      if (target['creator'] && viewer == target['creator']['id']) ||
         (target['owner'] && viewer == target['owner']['id']) ||
         (target['username'] && viewer == target['id'])
        i18_key = "#{activity['type'].downcase}_#{activity['action']}_#{view}-to-owner_#{mode}"
      else
        i18_key = "#{activity['type'].downcase}_#{activity['action']}_#{view}_#{mode}"
      end

      # Returns the message from translation index
      I18n.t(i18_key, i18_params)
    end

    # NOTE: We can optimize this by aggregating feeds when storing into redis
    # NOTE: Actually we use "live aggregation" instead, so we are able to modify the aggregation logic on the fly
    private def aggregate_feed(feed_index, limit: 100, offset: 0, cursor: nil, context: nil)
      # Get offset from cursor in reversed logic (LIFO), supports simple offset fallback
      offset = cursor ? cursor.to_i : offset.to_i
      # Temporary holder to store the final page of an aggregated feed
      aggregated_feed = []
      # The aggregation group index table
      groups = {}
      # We have to store the last activity of each activity group
      last_actions = {}
      # The index of the group index table
      group_index = -1
      # To determine the paging cursor we use a counter
      # Also we use this counter to check on break condition if limit is reached
      feed_count = 0
      # NOTE: Feeds are retrieved in reversed order to apply LIFO (=> reversed logic)
      # NOTE: The pagination limit has to be calculated on the fly
      # NOTE: Actually we use a maximum of 1000 activities from the target-feed fo each aggregated page
      feed = paginate(feed_index, limit: 1000, offset: offset)
      # Loop through all feeds (has a break statement, offset is optional)
      feed.each_with_index do |post, i|
        # Generates group tag (acts as the aggregation index)
        # NOTE: Currently we aggregate only activities which has the same type as the last activity (on the same target)
        group = post['group'] = "group:#{post['target']}" ##{post['time']}
        # Get activity actor
        actor = post['actor'].to_i
        # If group exist on this page then aggregate to this group
        if groups.has_key?(group)
          # Determine current aggregation group index
          current = groups[group]
          # Get current aggregation group feed
          current_feed = aggregated_feed[current]
          # Skip this part if the aggregation action is not the same as the last one
          if last_actions[group] === post['action']
            # Update activity count
            current_feed['activityCount'] += 1
            # Collect actors as unique
            current_feed['actors'] << actor unless current_feed['actors'].include?(actor)
            # Get intersection of actors and the users social context
            current_feed['actors'] &= context if context
          end
        # If group does not exist, creates a new group for aggregations
        elsif feed_count < limit.to_i
          # The feed count indicates the limit of an activity feed page
          feed_count += 1
          # Increment index on each new group (starting from -1)
          current = groups[group] = (group_index += 1)
          # Keep the last action to skip other activities on the same aggregation group
          last_actions[group] = post['action']
          # Set the whole activity object on each new group
          # which takes the last state of all activities
          current_feed = aggregated_feed[current] = post
          # We create a new array-field 'actors' on each
          # new group and add current actor to it
          current_feed['actors'] = [actor]
          # Init activity counter
          current_feed['activityCount'] = 1
        else
          # Breaks the aggregation process if limit is reached
          break
        end
        # Sets an aggregated feed id to prevent id conflicts with other activity views
        current_feed['id'] = Digest::SHA1.hexdigest("#{group}#{post['time']}").upcase
        # Set cursor position from current activity
        current_feed['cursor'] = (i + offset + 1).to_s
      end
      aggregated_feed
    end

    ## Cache Helpers ##

    private def get_from_cache(feed_index, params)
      # Determine when the last feed update was happened
      last_update = @storage.get("Update:#{feed_index}")
      # Get the current cache state
      last_state = @storage.get("Status:#{feed_index}")
      # Validated the cache state
      if validate_cache(last_update, last_state)
        last_cache = get_cached_feed(feed_index)
        cache_index = generate_index(params)
        return last_cache[cache_index] if last_cache
      else
        @storage.del("Cache:#{feed_index}")
      end
      nil
    end

    private def set_to_cache(feed_index, params, result)
      # Determine when the last feed update was happened
      last_update = @storage.get("Update:#{feed_index}")
      # Set initially timer if there are no actions
      if last_update.nil?
        last_update = Time.now.to_f
        @storage.set("Update:#{feed_index}", last_update - 1)
      end
      # Set the current cache state
      @storage.set("Status:#{feed_index}", last_update)
      # Update cache
      last_cache = get_cached_feed(feed_index) || {}
      cache_index = generate_index(params)
      last_cache[cache_index] = result
      @storage.set("Cache:#{feed_index}", gzip_json(last_cache))
      result
    end

    private def validate_cache(last_update, last_state)
      last_update.present? &&
      last_update == last_state &&
      # FIX: Force refresh when last update is too close to the current request
      Time.now.to_f - last_update.to_f >= 1.0 # time in seconds (float)
    end

    ## Helpers ##

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

    private def gzip_json(json)
      ActiveSupport::Gzip.compress(json.to_json)
    end

    private def gzip_feed(feed)
      gzip_json(
        feed.slice(
          :type,
          :actor,
          :object,
          :model,
          :target,
          :action,
          :foreign,
          :time,
          :id
        ).values
      )
    end

    private def unzip_json(json)
      uncompressed_json = ActiveSupport::Gzip.decompress(json)
      decoded_json = JSON.parse(uncompressed_json)
      # maybe we can solve the issue by using the Rails wrapper around
      # the ruby JSON lib, it has support for additional objects
      # see: https://simonecarletti.com/blog/2010/04/inside-ruby-on-rails-serializing-ruby-objects-with-json/
      # ActiveSupport::JSON.decode(uncompressed_json)
      # we would also need it on the encoding side I guess
    rescue Oj::ParseError => exception
      Airbrake.notify(exception, compressed_json: json,
                                 uncompressed_json: uncompressed_json)
      Rails.logger.error { "Error parsing Json from Redis #{exception}, " \
                           "value: #{uncompressed_json}" }
    rescue => exception
      Airbrake.notify(exception, compressed_json: json,
                                 uncompressed_json: uncompressed_json)
      Rails.logger.error { "Error parsing Json from Redis #{exception}, " \
                           "value: #{uncompressed_json}" }
      uncompressed_json
    else
      decoded_json
    end

    private def error_handler(error, feed, params)
      Rails.logger.error { error }
      Airbrake.notify(error, feed: feed, params: params)
      puts error
    end
  end
end
