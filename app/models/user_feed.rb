class UserFeed < Feed

  def redis_key(str)
    "feed:user:#{self.id}:#{str}"
  end
end
