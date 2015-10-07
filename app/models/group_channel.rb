class GroupChannel < Channel

  #belongs_to :group, inverse_of: :channel #, through: :memberships, source: :group

  #has_one :follower, class_name: User

  # validates_presence_of :group, :follower
  #
  # def unsubscribe(follower)
  #   GroupChannel.where(follower: follower).destroy
  # end

  def redis_key(topic_id)
    "group:#{topic_id}"
  end

  # for Pundit
  # def self.policy_class
  #   SlotPolicy
  # end
end
