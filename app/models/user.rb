class User < ActiveRecord::Base
  after_commit AuditService

  has_one :image, class_name: "MediaItem", as: :mediable, dependent: :destroy

  has_many :created_slots, class_name: "MetaSlot",
           foreign_key: "creator_id", inverse_of: :creator

  has_many :slot_settings, inverse_of: :user

  # I think I don't need this...
  has_many :meta_slots, through: :slot_settings #, source: :meta_slot

  has_many :std_slots, through: :created_slots
  has_many :re_slots, foreign_key: :slotter_id, inverse_of: :slotter
  has_many :group_slots, through: :groups

  has_many :own_groups, class_name: "Group",
           foreign_key: "owner_id", inverse_of: :owner
  has_many :memberships, inverse_of: :user
  has_many :groups, through: :memberships, source: :group

  validates :username, presence: true, length: { maximum: 20 }

  def is_invited?(group_id)
    membership = memberships.where(group_id: group_id)
    membership.exists? && membership.first.invited?
  end

  def can_invite?(group_id)
    group = Group.find(group_id)
    self == group.owner || group.members_can_invite
  end

  def is_member?(group_id)
    membership = memberships.where(group_id: group_id)
    membership.exists? && membership.first.active?
  end

  def is_owner?(group_id)
    group = Group.find(group_id)
    self == group.owner
  end

  def get_membership(group_id)
    memberships.where(group_id: group_id).first
  end
end
