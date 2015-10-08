class UserChannel < Channel

  #belongs_to :user, inverse_of: :channel #, through: :memberships, source: :group

  #has_one :follower, class_name: User

  #validates_presence_of :user, :follower

  # helper method to generate redis keys
  def redis_key(topic_id)
    "channel:user:#{topic_id}"
  end

  # for Pundit
  # def self.policy_class
  #   SlotPolicy
  # end
end
