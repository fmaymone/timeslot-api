module Follow
  def add_follower(user)
    unless self == user
      $redis.multi do
        $redis.sadd(user.redis_key(:following), [ feed_type, self.id ])
        $redis.sadd(self.redis_key(:followers), user.id)
      end
    end
  end

  def remove_follower(user)
    $redis.multi do
      $redis.srem(user.redis_key(:following), [ feed_type, self.id ])
      $redis.srem(self.redis_key(:followers), user.id)
    end
  end

  def followers
    $redis.smembers(self.redis_key(:followers))
  end

  # def friends
  #   $redis.sinter(self.redis_key(:following), self.redis_key(:followers))
  # end

  def is_followed_by(user)
    $redis.sismember(self.redis_key(:followers), user.id)
  end

  def is_following(user)
    $redis.sismember(user.redis_key(:following), [ feed_type, self.id ])
  end

  def follower_count
    $redis.scard(self.redis_key(:followers))
  end

  def redis_key(str)
    "Follow:#{feed_type}:#{self.id}:#{str}"
  end
end
