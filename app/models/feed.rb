module Feed
  def self.user_feed(user_id, params = {})
    feed = get_feed("Feed:#{user_id}:User")
    page = paginate(feed, params)
    enrich_messages(page, 'me')
  end

  def self.notification_feed(user_id, params = {})
    feed = get_feed("Feed:#{user_id}:Notification")
    page = paginate(feed, params)
    enrich_messages(page, 'notify')
  end

  def self.news_feed(user_id, params = {})
    feed = get_feed("Feed:#{user_id}:News")
    page = aggregate_feed(feed, params)
    enrich_messages(page, 'activity')
  end

  def self.get_feed(feed)
    $redis.smembers(feed).reverse!.map{|a| JSON.parse(a)}
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
      feed = Feed::get_feed(feed_key)
      feed.each do |post|
        if post[target_field].to_i == target_id #|| post['foreignId'].to_i == actor_id
          $redis.srem(feed_key, post.to_json)
        end
      end
    end
  end

  # TODO: We can optimize this by aggregating feeds when storing into redis
  # NOTE: If we use "live aggregation" we are able to modify
  # the aggregation logic on the fly
  def self.aggregate_feed(feed, limit: 25, offset: 0, cursor: nil)
    # Temporary holders to create aggregations
    offset = cursor ? cursor.to_i : offset.to_i
    aggregated_feed = []
    groups = {}
    index = -1
    count = 0
    # NOTE: Feeds are retrieved in reversed order to apply LIFO (=> reversed logic)
    # Loop through all feeds (has a break statement, offset is optional)
    feed[0, feed.count - offset].each do |post|
      # Prepare dictionary shortcuts
      actor = post['actor'].to_i
      # Generates group tag (aggregation index)
      group = post['group'] = "#{post['target']}#{post['activity']}" ##{post['time']}
      # Aggregate feed (indexed by group)
      if groups.has_key?(group)
        current = groups[group]
        current_feed = aggregated_feed[current]
        # Add actor as unique
        unless current_feed['actors'].include?(actor)
          # Collect actors
          current_feed['actors'] << actor
          # Collect usernames (we need 2 at maximum)
          current_feed['message']['USER2'] = post['user']['username'] unless current_feed['message'].has_key?('USER2')
          # Increase Usercount
          current_feed['message']['USERCOUNT'] += 1
        end
        # Update activity count
        current_feed['activityCount'] += 1
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
        # Sets a generated feed id
        current_feed['id'] = Digest::SHA1.hexdigest(group) #count.to_s
      else
        break
      end
      # Set current feed next cursor
      current_feed['cursor'] = ((count += 1) + offset).to_s
    end
    aggregated_feed
  end

  def self.enrich_messages(aggregated_feed, type)
    aggregated_feed.each do |feed|
      actors = feed['actors'] || []
      # Determine pluralization
      mode = actors.count > 2 ? 'aggregate' : (actors.count > 1 ? 'plural' : 'singular')
      # Determine translation key
      key = "#{feed['type'].downcase}_#{feed['activity']}_#{type}_#{mode}"
      # Update enriched message
      feed['message'] = I18n.t(key, feed['message'].symbolize_keys)
    end
    aggregated_feed
  end

  def self.paginate(feed, limit: 20, offset: 0, cursor: nil)
    # offset in reversed logic (LIFO)
    offset = cursor ? cursor.to_i : offset.to_i
    # paginate through offset and limit (catch MIN as MAX in reversed order)
    feed[offset..[offset + limit.to_i - 1, feed.count].min]
  end
end
