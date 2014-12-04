class User < ActiveRecord::Base
  after_commit AuditLog

  has_one :image, class_name: "MediaItem", as: :mediable, dependent: :destroy

  has_many :created_slots, class_name: "MetaSlot",
           foreign_key: "creator_id", inverse_of: :creator

  has_many :slot_settings, inverse_of: :user

  # I think I don't need this...
  has_many :meta_slots, through: :slot_settings #, source: :meta_slot

  has_many :std_slots, foreign_key: :owner_id, inverse_of: :owner
  has_many :re_slots, foreign_key: :slotter_id, inverse_of: :slotter
  has_many :group_slots, through: :groups

  has_many :own_groups, class_name: "Group",
           foreign_key: "owner_id", inverse_of: :owner
  has_many :memberships, inverse_of: :user
  has_many :groups, through: :memberships, source: :group

  has_many :friendships1,
           class_name: Friendship,
           foreign_key: "user_id",
           inverse_of: :user
  has_many :friendships2,
           class_name: Friendship,
           foreign_key: "friend_id",
           inverse_of: :friend
  has_many :friends1,
           through: :friendships1,
           source: :friend
  has_many :friends2,
           through: :friendships2,
           source: :user

  validates :username, presence: true, length: { maximum: 20 }

  # TODO: get friends with one query
  def friends
    friends1 + friends2
  end

  def delete
    # TODO: take care of created Slots, created Groups, Friendships,
    # Memberships, SlotSettings, StdSlots, ReSlots, User Image
    # TODO: add spec
    SoftDelete.call(self)
  end

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
