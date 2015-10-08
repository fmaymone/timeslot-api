class Feed

  #@@enricher = StreamRails::Enrich.new
  #mattr_reader :enricher

  # def initialize(topic)
  #   @topic_id = topic.id
  # end

  def follow!(user)
    $redis.multi do
      $redis.sadd(self.redis_key(:following), user.id)
      $redis.sadd(user.redis_key(:followers), self.id)
    end
  end

  def unfollow!(user)
    $redis.multi do
      $redis.srem(self.redis_key(:following), user.id)
      $redis.srem(user.redis_key(:followers), self.id)
    end
  end

  def followers
    user_ids = $redis.smembers(self.redis_key(:followers))
    User.where(:id => user_ids)
  end

  def following
    user_ids = $redis.smembers(self.redis_key(:following))
    User.where(:id => user_ids)
  end

  def friends
    user_ids = $redis.sinter(self.redis_key(:following), self.redis_key(:followers))
    User.where(:id => user_ids)
  end

  def followed_by?(user)
    $redis.sismember(self.redis_key(:followers), user.id)
  end

  def following?(user)
    $redis.sismember(self.redis_key(:following), user.id)
  end

  def followers_count
    $redis.scard(self.redis_key(:followers))
  end

  def following_count
    $redis.scard(self.redis_key(:following))
  end

  #-------------------------------

  def self.user_feed(user_id, params)
    feed = StreamRails.feed_manager.get_user_feed(user_id)
    page = paginate(feed, params)
    enricher.enrich_activities(page)
  end

  def self.news_feed(user_id, params, style = 'aggregated')
    feed = StreamRails.feed_manager.get_news_feeds(user_id)
    page = paginate(feed[style.to_sym], params)
    case style
      when :flat
        enricher.enrich_activities(page)
      else#:aggregated
        enricher.enrich_aggregated_activities(page)
    end
  end

  def self.notification_feed(user_id, params)
    feed = StreamRails.feed_manager.get_notification_feed(user_id)
    page = paginate(feed, params)
    enricher.enrich_activities(page)
  end

  # Cursor based pagination is a lot faster and supported as well.
  # To go with cursor based pagination we have to implement exchanging
  # of page hashes (as cursors) between backend and frontend.
  def self.paginate(feed, limit: 20, offset: 0, cursor: nil)
    (cursor ? feed.get(limit: limit.to_i,
                       id_lt: cursor,
                       mark_seen: true)
            : feed.get(limit: limit.to_i,
                       offset: offset,
                       mark_seen: true)
    )['results']
  end
end
