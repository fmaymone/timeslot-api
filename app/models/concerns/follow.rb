module Follow
  # Add the passed follower to the current object
  def add_follower(target)
    unless self == target
      # Start redis transaction
      $redis.multi do
        $redis.sadd(target.redis_key(:following), [ feed_type, self.id ].to_json)
        $redis.sadd(redis_key(:followers), target.id)
      end
    end
  end

  # Delegate helper method (inverted logic)
  def follow(target)
    target.add_follower(self)
  end

  # Remove the passed follower from the current object
  def remove_follower(target)
    unless self == target
      # Start redis transaction
      $redis.multi do
        $redis.srem(target.redis_key(:following), [ feed_type, self.id ].to_json)
        $redis.srem(redis_key(:followers), target.id)
      end
    end
  end

  # Remove all followers from the current object
  def remove_all_followers
    # TODO: do not fetching users from postgres
    User.where(id: followers).find_each do |follower|
      remove_follower(follower)
    end
  end

  # Delegate helper method (inverted logic)
  def unfollow(target)
    target.remove_follower(self)
  end

  # Remove all followers from the current object
  def unfollow_all
    followings.each do |following|
      target = following[0].constantize.where(id: following[1])
      unfollow(target)
    end
  end

  # Get all followers of the current object
  def followers
    $redis.smembers(redis_key(:followers))
  end

  # Get all followings of the current object
  def followings
    $redis.smembers(redis_key(:following))
  end

  # Determine if something is followed by passed target
  def followed_by?(target)
    $redis.sismember(redis_key(:followers), target.id)
  end

  # Delegate helper method (inverted logic)
  def follows?(target)
    following?(target)
  end

  # Determine if something is following the passed target
  def following?(target)
    target.followed_by?(self)
    #$redis.sismember(redis_key(:following), [ target.feed_type, target.id ].to_json)
  end

  def followers_count
    $redis.scard(redis_key(:followers))
  end

  def followings_count
    $redis.scard(redis_key(:following))
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
