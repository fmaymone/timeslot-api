module Channel
  def connect
    $redis.sadd(redis_key, self.id)
  end

  def disconnect
    $redis.srem(redis_key, self.id)
  end

  def is_connected?
    $redis.sismember(redis_key, self.id)
  end

  def connections
    $redis.smembers(redis_key)
  end

  def connection_count
    $redis.scard(redis_key)
  end

  def redis_key
    "Channel:#{self.user.id}"
  end

  module ClassMethods
    # TODO: Channel.notify not used at the moment
    def notify(params)
      # we using worker background processing to perform stream tasks asynchronously
      StreamJob.new.async.perform(connections, params) unless connections.empty?

      # Stream.send(follower.devices.active_sockets)
      # notify_queue = []
      # #followers.devices.where.not(socket: nil).find_each do |user|
      # followers.find_each do |user|
      #   #user.devices.where.not(socket: nil).find_in_batches do |devices|
      #   user.devices.active_sockets.find_in_batches do |devices|
      #     notify_queue.concat(devices)
      #   end
      # end
    end
  end
end
