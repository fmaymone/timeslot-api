module Feed
  def self.user_feed(user_id, params = {})
    begin
      feed = "Feed:#{user_id}:User"
      page = paginate(feed, params)
      enrich_feed(page, 'me')
    rescue => error
      error_handler(error, feed, params)
    end
  end

  def self.notification_feed(user_id, params = {})
    begin
      feed = "Feed:#{user_id}:Notification"
      page = paginate(feed, params)
      enrich_feed(page, 'notify')
    rescue => error
      error_handler(error, feed, params)
    end
  end

  def self.news_feed(user_id, params = {})
    begin
      feed = "Feed:#{user_id}:News"
      page = aggregate_feed(feed, params)
      enrich_feed(page, 'activity')
    rescue => error
      error_handler(error, feed, params)
    end
  end

  # TODO: implement helpers for feed removing during deletion
  # def self.remove_activity_from_feed(user, activity)
  # end
  # def self.remove_target_from_feed(user, target)
  # end

  def self.remove_from_feed(feed_type, target_id)
    ["Feed:#{user_id}:User",
     "Feed:#{user_id}:News",
     "Feed:#{user_id}:Notification"].each do |feed_key|
      # Fetch all target activities
      feed = $redis.lrange(feed_key, 0, -1)
      # Loop through all activities through all related feeds
      $redis.pipelined do
        feed.each do |post|
          feed_params = post.split(':')
          if feed_params[0] == feed_type && feed_params[1].to_i == target_id #|| post['foreignId'].to_i == actor_id
            # TODO: remove multiple activities (redis batch)
            # Remove activity
            $redis.lrem(feed_key, 1, post)
          end
        end
      end
    end
  end

  private

  def self.paginate(feed_index, limit: 25, offset: 0, cursor: nil)
    # Get offset in reversed logic (LIFO), supports simple cursor fallback
    offset = cursor ? cursor.to_i : offset.to_i
    # Catch MIN as MAX in reversed order
    min = [offset + limit.to_i, $redis.llen("Feed:#{feed_index}") - 1].min
    # NOTE: Feeds are retrieved in reversed order to apply LIFO (=> reversed logic)
    feed = $redis.lrange(feed_index, offset, min).reverse!
    # Enrich target activities
    feed.map{|a| enrich_activity(a)}
  end

  def self.enrich_activity(target_key)
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
        foreignId: target_feed[5],
        time: target_feed[6],
        feed: target_feed[7],
        id: target_feed[8],
    }.as_json
  end

  def self.enrich_feed(feed, view)
    feed.each do |activity|
      # Set single actors to array to simplify enrichment process
      activity['actors'] ||= [activity['actor'].to_i] if activity['actor']
      count = activity['actors'].count
      # In handy we remove the single field 'actor' on aggregated feeds
      activity.delete('actor')
      # Determine translation params
      # Get the first actor (from shared objects)
      actor = get_shared_object("Actor:#{activity['actors'].first}")
      # Adds the first username and sets usercount to translation params
      i18_params = { USER: actor['username'], USERCOUNT: count }
      # Get target (from shared objects)
      target = get_shared_object("Target:#{activity['feed']}:#{activity['target']}")
      # Enrich with custom activity data (shared objects)
      activity['data'] = { target: target, actor: actor }
      # Add the title to the translation params holder
      i18_params[:TITLE] = target['title'] || target['name'] if target['title'] || target['name']
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
    end
    feed
  end

  # TODO: We can optimize this by aggregating feeds when storing into redis
  # NOTE: If we use "live aggregation" we are able to modify
  # the aggregation logic on the fly
  def self.aggregate_feed(feed_index, limit: 25, offset: 0, cursor: nil)
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
      # Generates group tag (aggregation index)
      group = post['group'] = "#{post['target']}#{post['activity']}" ##{post['time']}
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

  def self.get_shared_object(feed_index)
    JSON.parse(
      ActiveSupport::Gzip.decompress(
        $redis.get(feed_index)
    ))
  end

  def self.get_feed_from_index(key, index)
    JSON.parse(
      ActiveSupport::Gzip.decompress(
        $redis.lindex(key, index)
    ))
  end

  def self.error_handler(error, feed, params)
    opts = {}
    opts[:parameters] = {
        feed: feed,
        params: params
    }
    Rails.logger.error { error }
    Airbrake.notify(error, opts)
  end
end
