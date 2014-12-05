class User < ActiveRecord::Base
  after_commit AuditLog

  has_one :image, class_name: MediaItem, as: :mediable, dependent: :destroy

  has_many :created_slots, class_name: MetaSlot,
           foreign_key: "creator_id", inverse_of: :creator

  has_many :slot_settings, inverse_of: :user

  # I think I don't need this...
  has_many :meta_slots, through: :slot_settings #, source: :meta_slot

  has_many :std_slots, foreign_key: :owner_id, inverse_of: :owner
  has_many :re_slots, foreign_key: :slotter_id, inverse_of: :slotter
  has_many :group_slots, through: :groups

  has_many :own_groups, class_name: Group,
           foreign_key: "owner_id", inverse_of: :owner
  has_many :memberships, inverse_of: :user
  has_many :groups, through: :memberships, source: :group

  has_many :friendships1, class_name: Friendship,
           foreign_key: "user_id", inverse_of: :user
  has_many :friendships2, class_name: Friendship,
           foreign_key: "friend_id", inverse_of: :friend

  # all this just to get the friends... TODO: refactor
  has_many :accepted_friendships1, -> { where state: '11' },
           class_name: Friendship, foreign_key: "user_id"
  has_many :accepted_friendships2, -> { where state: '11' },
           class_name: Friendship, foreign_key: "friend_id"
  has_many :friends1, through: :accepted_friendships1, source: :friend
  has_many :friends2, through: :accepted_friendships2, source: :user

  has_many :requested_friendships, -> { where state: '00' },
           class_name: Friendship, foreign_key: "user_id"
  has_many :offered_friendships, -> { where state: '00' },
           class_name: Friendship, foreign_key: "friend_id"
  has_many :requested_friends, through: :requested_friendships, source: :friend

  validates :username, presence: true, length: { maximum: 20 }

  ## friendship related ##

  # def requested_friendships
  #   # friendships1.where(state: '00')
  #   friendships1.open
  # end

  # def offered_friendships
  #   # friendships2.where(state: '00')
  #   friendships2.open
  # end

  # TODO: get friends with one query
  def friends
    friends1 + friends2
  end

  # def friendships
  #   friendships1 + friendships2
  # end

  # def friend_with?(user_id)
  #   friendships1.where("friend_id= ?", user_id).exists? ||
  #     friendships2.where("user_id= ?", user_id).exists?
  # end

  def friendship(user_id)
    friendships1.where("friend_id= ?", user_id).first ||
      friendships2.where("user_id= ?", user_id).first
  end

  def offered_friendship(user_id)
    offered_friendships.where("user_id= ?", user_id).first
  end

  ## group related ##
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

  def delete
    # TODO: take care of created Slots, created Groups, Friendships,
    # Memberships, SlotSettings, StdSlots, ReSlots, User Image
    # TODO: add spec
    SoftDelete.call(self)
  end
end
