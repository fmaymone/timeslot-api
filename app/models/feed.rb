module Feed
  def self.user_feed(user_id, params = {})
    feed = get_feed("Feed:#{user_id}:User")
    paginate(feed, params)
  end

  def self.news_feed(user_id, params = {})
    feed = get_feed("Feed:#{user_id}:News")
    aggregate_feed(feed, params)
  end

  def self.notification_feed(user_id, params = {})
    feed = get_feed("Feed:#{user_id}:Notification")
    paginate(feed, params)
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
  def self.aggregate_feed(feed, limit: 20, offset: 0, cursor: nil)
    # Temporary holders to create aggregations
    offset = cursor ? cursor.to_i : offset.to_i
    aggregated_feed = []
    usernames = {}
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
          # Collect actor
          current_feed['actors'] << actor
          # Collect username
          usernames[group] << post['user']['username']
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
        # Instantiate a new username array on each
        # new group and add current actor to it
        usernames[group] = [post['user']['username']]
        # Init activity counter
        current_feed['activityCount'] = 1
        # Set current feed index
        current_feed['id'] = Digest::SHA1.hexdigest(group) #count.to_s
      else
        break
      end
      # # Update aggregated activity message
      current_feed['message'] = aggregate_message(usernames[group], post['activity'])
      # Set current feed next cursor
      current_feed['cursor'] = ((count += 1) + offset).to_s
    end
    aggregated_feed
  end

  def self.aggregate_message(usernames, activity)
    template = I18n.t('activity_' + activity) #post['message']
    # Set message as a template for the aggregation message
    if usernames.count == 2
      "#{usernames[0].to_s} and #{usernames[1].to_s} #{template}"
    elsif usernames.count > 2
      "#{usernames[0].to_s} and #{(usernames.count - 1).to_s} others #{template}"
    else
      "#{usernames[0].to_s} #{template}"
    end
  end

  def self.paginate(feed, limit: 20, offset: 0, cursor: nil)
    offset = cursor ? cursor.to_i : offset.to_i
    feed[offset..[offset + limit.to_i - 1, feed.count].min] #.sort_by{|day| day}
  end
end
