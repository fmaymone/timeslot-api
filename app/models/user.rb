class User < ActiveRecord::Base
  after_commit AuditService

  has_one :image, class_name: "MediaItem", as: :mediable
  has_many :own_groups, class_name: "Group", inverse_of: :owner
  has_many :memberships, inverse_of: :user
  has_many :groups, through: :memberships

  validates :username, presence: true, length: { maximum: 20 }

  def has_invitation?(group_id)
    memberships.where(group_id: group_id).exists?
  end

  def can_invite?(group_id)
    group = Group.find(group_id)
    self == group.owner || group.subs_can_invite
  end
end
