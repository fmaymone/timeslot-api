class UserChannel < Channel

  #belongs_to :user, inverse_of: :channel #, through: :memberships, source: :group

  #has_one :follower, class_name: User

  validates_presence_of :user, :follower

  def unsubscribe(follower)
    UserChannel.where(follower: follower).destroy
  end

  # for Pundit
  # def self.policy_class
  #   SlotPolicy
  # end
end
