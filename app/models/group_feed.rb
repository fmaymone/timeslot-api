class GroupFeed < Feed

  def redis_key(str)
    "feed:group:#{self.id}:#{str}"
  end
end
