class SlotChannel < Channel

  #belongs_to :slot, class_name: BaseSlot#, inverse_of: :slot #, through: :memberships, source: :group
  #belongs_to :follower, class_name: User#, inverse_of: :slots

  #has_one :follower, class_name: User#, inverse_of: :channel

  #validates_presence_of :slot, :follower

  # def unsubscribe(user)
  #   SlotChannel.where(follower: user).destroy
  # end

  def redis_key(topic_id)
    "channel:slot:#{topic_id}"
  end

  # for Pundit
  # def self.policy_class
  #   SlotPolicy
  # end
end
