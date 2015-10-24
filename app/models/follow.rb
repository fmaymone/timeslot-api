module Follow
  # Add the passed follower to the target
  def add_follower(target)
    unless self == target
      # Start redis transaction
      $redis.multi do
        $redis.sadd(target.redis_key(:following), [ feed_type, self.id ].to_json)
        $redis.sadd(self.redis_key(:followers), target.id)
      end
    end
  end

  # Delegate helper method (inverted logic)
  def follow(target)
    target.add_follower(self)
  end

  # Remove the passed follower from the target
  def remove_follower(target)
    # Start redis transaction
    $redis.multi do
      $redis.srem(target.redis_key(:following), [ feed_type, self.id ].to_json)
      $redis.srem(self.redis_key(:followers), target.id)
    end
  end

  # Delegate helper method (inverted logic)
  def unfollow(target)
    target.remove_follower(self)
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

  # Delegate helper method (inverted logic)
  def follows?(target)
    target.followed_by?(self)
  end

  # Determine if something is following the passed target
  def following?(target)
    $redis.sismember(self.redis_key(:following), [ target.feed_type, target.id ].to_json)
  end

  def followers_count
    $redis.scard(self.redis_key(:followers))
  end

  def followings_count
    $redis.scard(self.redis_key(:following))
  end

  def redis_key(str)
    "Follow:#{feed_type}:#{self.id}:#{str}"
  end

  def feed_type
    self.class.name
  end

  # def follows_each_other
  #   $redis.sinter(self.redis_key(:following), self.redis_key(:followers))
  # end
end
