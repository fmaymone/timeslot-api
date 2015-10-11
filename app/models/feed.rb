module Feed
  def self.user_feed(user_id, params = {})
    feed = get_feed("Feed:#{user_id}:User")
    paginate(feed, params)
  end

  def self.news_feed(user_id, params = {})
    feed = get_feed("Feed:#{user_id}:News")
    paginate(feed, :aggregated, params)
  end

  def self.notification_feed(user_id, params = {})
    feed = get_feed("Feed:#{user_id}:Notification")
    paginate(feed, params)
  end

  def self.get_feed(feed)
    #feed = $redis.lrange(key, offset, limit)
    $redis.smembers(feed).reverse!.map{|a| JSON.parse(a)}
  end

  # TODO: We can optimize this by aggregating feeds when storing into redis
  def self.aggregate_feed(feed)
    # Temporary holders to create aggregations during request
    aggregated_feed = []
    usernames = []
    groups = {}
    index = -1
    count = 0
    # Loop through all feeds
    feed.each do |post|
      # Prepare dictionary shortcuts
      actor = post['actor'].to_i
      group = post['group'].to_s
      message = post['message'].to_s
      current = groups[group]
      # Aggregate feed (indexed by group)
      if current.presence
        current_feed = aggregated_feed[current]
        # Add actor as unique
        unless current_feed['actors'].include?(actor)
          # Collect actor
          current_feed['actors'] << actor
          # Collect username
          usernames << post['user']['username']
          # Update activity count
          current_feed['activity_count'] += 1
        end
      else
        # Increment index on each new group (starting from -1)
        current = (index += 1)
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
        usernames = [post['user']['username']]
        # Init activity counter
        current_feed['activity_count'] = 1
      end
      # Update aggregated activity message
      if usernames.count > 1
        current_feed['message'] =
            "#{usernames[0].to_s} and #{(usernames.count == 2 ?
            'one other' : "#{(usernames.count - 1).to_s} others")} #{message}"
      else
        current_feed['message'] = "#{usernames[0].to_s} #{message}"
      end
      # Set current feed index as cursor id
      current_feed['id'] = (count += 1)
    end
    aggregated_feed
  end

  # Cursor based pagination is a lot faster and supported as well.
  # To go with cursor based pagination we have to implement exchanging
  # of page hashes (as cursors) between backend and frontend.
  def self.paginate(feed, style = nil, limit: 20, offset: 0, cursor: nil)
    feed = aggregate_feed(feed) if style == :aggregated
    if cursor
      offset = cursor.to_i + 1
      # feed.each_with_index do |post, index|
      #   if post['id'].eql?(cursor)
      #     offset = index + 1
      #     break
      #   end
      # end
    end
    feed[offset.to_i..(offset.to_i + limit.to_i - 1)] #.sort_by{|day| day}
  end
end
