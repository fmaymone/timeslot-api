class SlotFeed < Feed

  def redis_key(str)
    "feed:slot:#{self.id}:#{str}"
  end
end
