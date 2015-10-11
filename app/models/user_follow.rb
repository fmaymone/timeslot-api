module UserFollow

  include Follow

  # only user has followings
  def following
    $redis.smembers(self.redis_key(:following))
  end

  # only user has following_count
  def following_count
    $redis.scard(self.redis_key(:following))
  end

  def feed_type
    'User'
  end
end
