module Feed
  def self.user_feed(user_id, params = {})
    feed = get_feed("Feed:#{user_id}:User")
    paginate(feed, params)
  end

  def self.news_feed(user_id, params = {})
    aggregate_feed(get_feed("Feed:#{user_id}:News"), params)
  end

  def self.notification_feed(user_id, params = {})
    feed = get_feed("Feed:#{user_id}:Notification")
    paginate(feed, params)
  end

  def self.get_feed(feed)
    $redis.smembers(feed).reverse!.map{|a| JSON.parse(a)}
  end

  # TODO: We can optimize this by aggregating feeds when storing into redis
  def self.aggregate_feed(feed, limit: 20, offset: 0, cursor: nil)
    # Temporary holders to create aggregations
    offset = cursor ? cursor.to_i : offset.to_i
    aggregated_feed = []
    usernames = {}
    groups = {}
    index = -1
    count = 0
    # Loop through all feeds
    feed[0, feed.count - offset].each do |post|
      # Prepare dictionary shortcuts
      actor = post['actor'].to_i
      group = post['group']
      message = post['message']
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
        #current_feed['id'] = count.to_s
      else
        break
      end
      # Update aggregated activity message
      usernames_feed = usernames[group]
      if usernames_feed.count == 2
        current_feed['message'] =
            "#{usernames_feed[0].to_s} and #{usernames_feed[1].to_s} #{message}"
      elsif usernames_feed.count > 2
        current_feed['message'] =
            "#{usernames_feed[0].to_s} and #{(usernames_feed.count - 1).to_s} others #{message}"
      else
        current_feed['message'] = "#{usernames_feed[0].to_s} #{message}"
      end
      # Set current feed next cursor
      current_feed['cursor'] = ((count += 1) + offset).to_s
    end
    aggregated_feed
  end

  def self.paginate(feed, limit: 20, offset: 0, cursor: nil)
    offset = cursor.to_i if cursor
    feed[offset.to_i..[offset.to_i + limit.to_i - 1, feed.count].min] #.sort_by{|day| day}
  end
end
