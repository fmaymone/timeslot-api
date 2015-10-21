module Follow
  def add_follower(target)
    unless self == target
      $redis.multi do
        $redis.sadd(target.redis_key(:following), [ feed_type, self.id ].to_json)
        $redis.sadd(self.redis_key(:followers), target.id)
      end
    end
  end

  def remove_follower(target)
    $redis.multi do
      $redis.srem(target.redis_key(:following), [ feed_type, self.id ].to_json)
      $redis.srem(self.redis_key(:followers), target.id)
    end
    # Remove activities from target feeds:
    Feed::remove_user_from_feed(target, self)
  end

  def followers
    $redis.smembers(self.redis_key(:followers))
  end

  def followed_by?(target)
    $redis.sismember(self.redis_key(:followers), target.id)
  end

  def following?(target)
    $redis.sismember(self.redis_key(:following), [ target.feed_type, target.id ].to_json)
  end

  def follower_count
    $redis.scard(self.redis_key(:followers))
  end

  def redis_key(str)
    "Follow:#{feed_type}:#{self.id}:#{str}"
  end

  # def follows_each_other
  #   $redis.sinter(self.redis_key(:following), self.redis_key(:followers))
  # end
end
