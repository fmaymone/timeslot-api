module Follow

  # Initialize the storage controller
  def storage
    @storage ||= RedisStorage
  end
  
  # Add the passed follower to the current object
  def add_follower(follower)
    # Skip self and do not skip private targets
    if self != follower #and (self.try(:visibility) != 'private')
      # Start redis transaction
      storage.transaction do
        storage.add_to_set(follower.redis_key(:following), self.id)
        storage.add_to_set(self.redis_key(:followers), follower.id)
      end
    end
  rescue => error
    error_handler(error, "failed: add follower '#{follower.id}' to target '#{self.id}' as worker job")
  end

  # Delegate helper method (inverted logic)
  def follow(target)
    target.add_follower(self) # self => follower
  end

  # Remove the passed follower from the current object
  def remove_follower(target)
    unless self == target
      # Start redis transaction
      storage.transaction do
        storage.remove_from_set(target.redis_key(:following), self.id)
        storage.remove_from_set(self.redis_key(:followers), target.id)
      end
    end
  rescue => error
    error_handler(error, "failed: remove follower '#{self.id}' from target '#{target.id}' as worker job")
  end

  # Remove all followers from the current object (self)
  def remove_all_followers
    followers.each do |follower|
      storage.remove_from_set("Follow:User:#{follower}:following", self.id)
    end
    storage.del(redis_key(:followers))
  rescue => error
    error_handler(error, "failed: user '#{self.id}' remove all followers as worker job")
  end

  # Delegate helper method (inverted logic)
  def unfollow(target)
    target.remove_follower(self)
  end

  # Remove all followings from the current object (self)
  def unfollow_all
    followings.each do |following|
      %w(User Slot Group).each do |context|
        storage.remove_from_set("Follow:#{context}:#{following}:followers", self.id)
      end
    end
    storage.del(redis_key(:following))
  rescue => error
    error_handler(error, "failed: user '#{self.id}' unfollow all targets as worker job")
  end

  # Get all followers of the current object
  def followers
    storage.get_from_set(redis_key(:followers))
  end

  # Get all followings of the current object
  def followings
    storage.get_from_set(redis_key(:following))
  end

  # Determine if something is followed by passed target
  def followed_by?(target)
    storage.set_include?(redis_key(:followers), target.id)
  end

  # Delegate helper method (inverted logic)
  def follows?(target)
    following?(target)
  end

  # Determine if something is following the passed target
  def following?(target)
    target.followed_by?(self)
  end

  def followers_count
    storage.length_of_set(redis_key(:followers))
  end

  def followings_count
    storage.length_of_set(redis_key(:following))
  end

  def redis_key(str)
    "Follow:#{defined?(activity_type) ? activity_type : self.class.name}:#{self.id}:#{str}"
  end

  ## Helpers (Social Context) ##

  # Returns an array which includes all users which follow each other
  def follows_each_other
    storage.intersect(redis_key(:following), redis_key(:followers))
  end

  # Get intersection of 2 groups of followers
  def followers_intersect(target)
    storage.intersect(redis_key(:followers), target.redis_key(:followers))
  end

  # Get subtraction of 2 groups of followers
  def followers_subtract(target)
    storage.difference(redis_key(:followers), target.redis_key(:followers))
  end

  private def error_handler(error, message, params = nil)
    Rails.logger.error { error }
    Airbrake.notify(error, message: message, params: params)
  end
end
