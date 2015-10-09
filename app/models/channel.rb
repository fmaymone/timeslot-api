module Channel

  def initialize(topic)
    @topic_id = topic.id
  end

  def connect!(device)
    $redis.sadd(redis_key, device.id)
  end

  def disconnect!(device)
    $redis.srem(redis_key, device.id)
  end

  def is_connected?(device)
    $redis.sismember(redis_key, device.id)
  end

  def connections
    $redis.smembers(redis_key)
  end

  def connection_count
    $redis.scard(redis_key)
  end

  def redis_key(topic_id)
    "Channel:#{topic_id}"
  end

  def self.notify(params)
    # Stream.send(follower.devices.active_sockets)

    # notify_queue = []
    #
    # #followers.devices.where.not(socket: nil).find_each do |user|
    # followers.find_each do |user|
    #   #user.devices.where.not(socket: nil).find_in_batches do |devices|
    #   user.devices.active_sockets.find_in_batches do |devices|
    #     notify_queue.concat(devices)
    #   end
    # end

    # we using worker background processing to start request tasks asynchronously
    StreamJob.new.async.perform(connections, params) #unless connections.empty?
  end

  # The user who made the update
  # def activity_actor
  #   raise NotImplementedError,
  #         "Subclasses must define the method 'activity_actor'."
  # end

  #self.inheritance_column = :type

  # activity channels
  # has_many :user_channels
  # has_many :group_channels
  # has_many :slot_channels

  # scope :user,  -> { where(type: 'user') }
  # scope :group, -> { where(type: 'group') }
  # scope :slot,  -> { where(type: 'slot') }

  # Figures out which animals will subclass the Animal model
  # def self.type
  #   %w(user group slot)
  # end
end
