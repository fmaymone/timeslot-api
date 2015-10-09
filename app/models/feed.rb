module Feed
  def self.user_feed(user_id, params)
    feed = get_feed("Feed:#{user_id}:User")
    paginate(feed, params)
  end

  def self.news_feed(user_id, params)
    feed = get_feed("Feed:#{user_id}:News")
    paginate(feed, :aggregated, params)
  end

  def self.notification_feed(user_id, params)
    feed = get_feed("Feed:#{user_id}:Notification")
    paginate(feed, params)
  end

  def self.get_feed(feed)
    #feed = $redis.lrange(key, offset, limit)
    $redis.smembers(feed).reverse.map{|a| JSON.parse(a)}
  end

  def self.aggregate_feed(feed)
    aggregated_feed = []
    usernames = []
    last_group = ''
    index = -1

    feed.each do |value|
      message = value['message']
      if value['group'].eql?(last_group)
        unless aggregated_feed[index]['actors'].include?(value['actor'])
          # Collect actors
          aggregated_feed[index]['actors'] << value['actor']
          # Set new id as last id
          aggregated_feed[index]['id'] = value['id']
          # Collect username
          usernames << value['user']['username']
          # Set actor to last actor
          actors = aggregated_feed[index]['actors']
        end
      else
        index += 1
        aggregated_feed[index] = value
        aggregated_feed[index]['actors'] = [value['actor']]
        aggregated_feed[index].delete('actor')
        last_group = value['group']
        usernames = [value['user']['username']]
      end
      if usernames.count > 4
        aggregated_feed[index]['message'] = usernames[0..2].join(", ") + " and #{actors.count - 2} others " + message.from(message.index(' '))
      elsif usernames.count > 1
        aggregated_feed[index]['message'] = usernames[0..1].join(", ") + " and " + usernames[2].to_s + message.from(message.index(' '))
      end
    end
    aggregated_feed
  end

  # Cursor based pagination is a lot faster and supported as well.
  # To go with cursor based pagination we have to implement exchanging
  # of page hashes (as cursors) between backend and frontend.
  def self.paginate(feed, style = nil, limit: 20, offset: 0, cursor: nil)
    feed = aggregate_feed(feed) if style == :aggregated
    if cursor
      feed.each_with_index do |value, index|
        if value['id'].eql?(cursor)
          offset = index + 1
          break
        end
      end
    end
    feed[offset.to_i..(offset.to_i + limit.to_i - 1)] #.sort_by{|day| day}
  end
end
