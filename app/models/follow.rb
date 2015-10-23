module Follow
  # Add the passed follower to the target
  def add_follower(target)
    unless self == target
      $redis.multi do
        $redis.sadd(target.redis_key(:following), [ feed_type, self.id ].to_json)
        $redis.sadd(self.redis_key(:followers), target.id)
      end
    end
  end

  # Remove the passed follower from the target
  def remove_follower(target)
    $redis.multi do
      $redis.srem(target.redis_key(:following), [ feed_type, self.id ].to_json)
      $redis.srem(self.redis_key(:followers), target.id)
    end
    # Remove activities from target feeds:
    Feed::remove_user_from_feed(target, self)
  end

  # Get all followers of the target
  def followers
    $redis.smembers(self.redis_key(:followers))
  end

  # Get all followings of the target
  def followings
    $redis.smembers(self.redis_key(:following))
  end

  # Determine if something is followed by passed target
  def followed_by?(target)
    $redis.sismember(self.redis_key(:followers), target.id)
  end

  # Determine if something is following the passed target
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
