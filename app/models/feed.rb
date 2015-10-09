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
    groups = {}
    index = -1

    feed.each do |value|
      actor = value['actor'].to_i
      group = value['group'].to_s
      message = value['message'].to_s
      if groups[group].presence
        unless aggregated_feed[groups[group]]['actors'].include?(actor)
          # Collect actors
          aggregated_feed[groups[group]]['actors'] << actor
          # Set new id as last id
          #aggregated_feed[groups[group]]['id'] = value['id']
          # Set actor to last actor
          #aggregated_feed[groups[group]]['user'] = value['user']
          # Collect username
          usernames << value['user']['username']
        end
      else
        groups[group] = (index += 1)
        aggregated_feed[groups[group]] = value
        aggregated_feed[groups[group]]['actors'] = [actor]
        aggregated_feed[groups[group]].delete('actor')
        usernames = [value['user']['username']]
      end
      if usernames.count > 4
        aggregated_feed[groups[group]]['message'] = usernames[0..2].join(", ") + " and #{usernames.count - 2} others " + message.from(message.index(' '))
      elsif usernames.count > 2
        aggregated_feed[groups[group]]['message'] = usernames[0..1].join(", ") + " and " + usernames[usernames.count - 2].to_s + message.from(message.index(' '))
      elsif usernames.count > 1
        aggregated_feed[groups[group]]['message'] = usernames[0].to_s + " and " + usernames[1].to_s + message.from(message.index(' '))
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
