module Follow
  def add_follower(target)
    unless self == target
      $redis.multi do
        $redis.sadd(target.redis_key(:following), [ feed_type, self.id ])
        $redis.sadd(self.redis_key(:followers), target.id)
      end
    end
  end

  def remove_follower(target)
    $redis.multi do
      $redis.srem(target.redis_key(:following), [ feed_type, self.id ])
      $redis.srem(self.redis_key(:followers), target.id)
    end
  end

  def followers
    $redis.smembers(self.redis_key(:followers))
  end

  # def friends
  #   $redis.sinter(self.redis_key(:following), self.redis_key(:followers))
  # end

  def is_followed_by(target)
    $redis.sismember(self.redis_key(:followers), target.id)
  end

  def is_following(target)
    $redis.sismember(self.redis_key(:following), [ target.feed_type, target.id ])
  end

  def follower_count
    $redis.scard(self.redis_key(:followers))
  end

  def redis_key(str)
    "Follow:#{feed_type}:#{self.id}:#{str}"
  end
end
