module Feed
  def self.user_feed(user_id, params)
    feed = "Feed:#{user_id}:User"
    paginate(feed, params)
  end

  def self.news_feed(user_id, params)
    feed = "Feed:#{user_id}:News"
    paginate(feed, :aggregated, params)
  end

  def self.notification_feed(user_id, params)
    feed = "Feed:#{user_id}:Notification"
    paginate(feed, params)
  end

  def self.aggregate_feed(feed)
    feed
  end

  # Cursor based pagination is a lot faster and supported as well.
  # To go with cursor based pagination we have to implement exchanging
  # of page hashes (as cursors) between backend and frontend.
  def self.paginate(key, style = nil, limit: 20, offset: 0, cursor: nil)
    if cursor
      feed = $redis.smembers(key)
      feed = aggregate_feed(feed) if style == :aggregated
      feed.each_with_index do |value, index|
        if value['id'].eql?(cursor)
          offset = index
          break
        end
      end
    else
      #feed = $redis.lrange(key, offset, limit)
      feed = $redis.smembers(key)
    end
    feed = feed[offset.to_i..(offset.to_i + limit.to_i - 1)]
    feed.map{|a| JSON.parse(a)} #.sort_by{|day| day}
  end
end
