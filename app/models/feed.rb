module Feed
  def self.user_feed(user_id, params = {})
    feed = $redis.smembers("Feed:#{user_id}:User")
    page = paginate(feed, params)
    enrich_messages(page, 'me')
  end

  def self.notification_feed(user_id, params = {})
    feed = $redis.smembers("Feed:#{user_id}:Notification")
    page = paginate(feed, params)
    enrich_messages(page, 'notify')
  end

  def self.news_feed(user_id, params = {})
    feed = $redis.smembers("Feed:#{user_id}:News")
    page = aggregate_feed(feed, params)
    enrich_messages(page, 'activity')
  end

  def self.remove_user_from_feed(user, actor)
    remove_from_feed('actor', user.id, actor.id)
  end

  def self.remove_target_from_feed(user, target)
    remove_from_feed('target', user.id, target.id)
  end

  def self.remove_from_feed(target_field, user_id, target_id)
    ["Feed:#{user_id}:User",
     "Feed:#{user_id}:News",
     "Feed:#{user_id}:Notification"].each do |feed_key|
      feed = $redis.smembers(feed_key)
      # Divide feed list into smaller chunks to handle mass delete
      # to redis through the native bulk wrapper $redis.multi
      feed.each_slice(100) do |chunk|
        $redis.multi do
          chunk.each do |post|
            if ActiveSupport::Gzip.decompress(post)[target_field].to_i == target_id #|| post['foreignId'].to_i == actor_id
              $redis.srem(feed_key, post) #post.to_json
            end
          end
        end
      end
    end
  end

  def self.paginate(feed, limit: 25, offset: 0, cursor: nil)
    # Get offset in reversed logic (LIFO), supports simple cursor fallback
    offset = cursor ? cursor.to_i : offset.to_i
    # Catch MIN as MAX in reversed order
    min = [offset + limit.to_i - 1, feed.count].min
    # paginate through offset and limit
    feed[offset..min].reverse!.map{|a| JSON.parse(ActiveSupport::Gzip.decompress(a))}
  end

  def self.enrich_messages(feed, view)
    feed.each do |activity|
      # Actor can also be blank (good if no actor is settable, like: "Group was deleted")
      count = (activity['actors'] || []).count
      # Determine pluralization
      mode = count > 2 ? 'aggregate' : (count > 1 ? 'plural' : 'singular')
      # Determine translation key
      key = "#{activity['type'].downcase}_#{activity['activity']}_#{view}_#{mode}"
      # Determine translation params
      params = activity['message'].symbolize_keys
      # Update message params with enriched message
      activity['message'] = I18n.t(key, params)
    end
    feed
  end

  # TODO: We can optimize this by aggregating feeds when storing into redis
  # NOTE: If we use "live aggregation" we are able to modify
  # the aggregation logic on the fly
  def self.aggregate_feed(feed, limit: 25, offset: 0, cursor: nil)
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
    # Loop through all feeds (has a break statement, offset is optional)
    feed[0..(feed.count - offset)].reverse!.each do |post|
      # Parse JSON from string
      post = JSON.parse(ActiveSupport::Gzip.decompress(post))
      # Prepare dictionary shortcuts
      actor = post['actor'].to_i
      # Generates group tag (aggregation index)
      group = post['group'] = "#{post['target']}#{post['activity']}" ##{post['time']}
      # If group exist on this page then aggregate to this group
      if groups.has_key?(group)
        # Determine current aggregation group index
        current = groups[group]
        # Get current aggregation group feed
        current_feed = aggregated_feed[current]
        # Update activity count
        current_feed['activityCount'] += 1
        # Add actors as unique
        unless current_feed['actors'].include?(actor)
          # Collect further actors
          current_feed['actors'] << actor
          # Collect further usernames (we need 2 at maximum)
          current_feed['message']['USER2'] = post['user']['username'] unless current_feed['message'].has_key?('USER2')
          # Increase user count
          current_feed['message']['USERCOUNT'] += 1
        end
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
        # In handy we remove the single field 'actor' on aggregated feeds
        current_feed.delete('actor')
        # Adds the first username + usercount for aggregated messaging
        current_feed['message'] = { 'USER' => post['user']['username'], 'USERCOUNT' => 1 }
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
end
