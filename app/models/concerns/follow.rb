module Follow
  # Add the passed follower to the current object
  def add_follower(follower)
    # Skip self and private targets
    if (self != follower) and (self.try(:visibility) != 'private')
      # Start redis transaction
      $redis.multi do
        $redis.sadd(follower.redis_key(:following), [ feed_type, self.id ].to_json)
        $redis.sadd(redis_key(:followers), follower.id)
      end
    end
  end

  # Delegate helper method (inverted logic)
  def follow(target)
    target.add_follower(self) # self => follower
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

  # Remove all followers from the current object (self)
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

  # Remove all followings from the current object (self)
  def unfollow_all
    followings.each do |following|
      following = JSON.parse(following)
      # TODO: do not fetching users from postgres
      target = Object.const_get(following[0]).where(id: following[1]).try(:first)
      unfollow(target) if target
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

  # Try to return the supertype of each subclasses (e.g. 'Slot' instead of 'StdSlotPublic')
  def feed_type
    self.try(:activity_type) || self.class.name
  end

  ## Helpers (Social Context) ##

  # Returns an array which includes all users which follow each other
  def follows_each_other
    $redis.sinter(redis_key(:following), redis_key(:followers))
  end

  # Get intersection of 2 groups of followers
  def followers_intersect(target)
    $redis.sinter(redis_key(:followers), target.redis_key(:followers))
  end

  # Get subtraction of 2 groups of followers
  def followers_subtract(target)
    $redis.sdiff(redis_key(:followers), target.redis_key(:followers))
  end
end
