class Channel < ActiveRecord::Base
  after_commit AuditLog

  self.abstract_class = true

  #has_many :followers, class_name: User, inverse_of: :follower

  #validates :follower, presence: true

  def notify_channel(user_ids)
    # Stream.send(follower.devices.active_sockets)
    pp followers.devices.active_sockets

    notify_queue = []

    #followers.devices.where.not(socket: nil).find_each do |user|
    followers.find_each do |user|
      #user.devices.where.not(socket: nil).find_in_batches do |devices|
      user.devices.active_sockets.find_in_batches do |devices|
        notify_queue.concat(devices)
      end
    end

    pp notify_queue

    # we using worker background processing to start request tasks asynchronously
    #NotifyJob.new.async.perform(notify_queue.as_json, params) unless notify_queue.empty?
  end

  def subscribe(follower)
    create_or_update(follower: follower)
    #SlotChannel.find_by(slot: slot, follower: follower) ||
    #SlotChannel.create(slot: slot, follower: follower)
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
