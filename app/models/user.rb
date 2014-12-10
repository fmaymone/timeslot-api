class User < ActiveRecord::Base
  after_commit AuditLog

  has_many :image, -> { where deleted_at: nil }, class_name: MediaItem,
          as: :mediable

  has_many :created_slots, class_name: MetaSlot,
           foreign_key: "creator_id", inverse_of: :creator

  has_many :slot_settings, inverse_of: :user

  # TODO: I think I don't need this, remove after alarm stuff is in place
  # has_many :meta_slots, through: :slot_settings #, source: :meta_slot

  has_many :std_slots, foreign_key: :owner_id, inverse_of: :owner
  has_many :re_slots, foreign_key: :slotter_id, inverse_of: :slotter
  has_many :group_slots, through: :groups

  has_many :own_groups, class_name: Group,
           foreign_key: "owner_id", inverse_of: :owner
  has_many :memberships, inverse_of: :user
  has_many :groups, through: :memberships, source: :group

  # all friendships (regardless state & deleted_at)
  has_many :initiated_friendships, class_name: Friendship,
           foreign_key: "user_id", inverse_of: :user
  has_many :received_friendships, class_name: Friendship,
           foreign_key: "friend_id", inverse_of: :friend

  # friends
  has_many :friends_by_request, -> { merge(Friendship.established) },
           through: :initiated_friendships, source: :friend
  has_many :friends_by_offer, -> { merge(Friendship.established) },
           through: :received_friendships, source: :user

  # not yet friends
  has_many :requested_friends, -> { merge Friendship.open },
           through: :initiated_friendships, source: :friend
  has_many :offered_friends, -> { merge Friendship.open },
           through: :received_friendships, source: :user

  validates :username, presence: true, length: { maximum: 20 }

  ## slot related ##

  def representation?(meta_slot)
    std_slots.active.where(meta_slot: meta_slot).exists? ||
      group_slots.active.where(meta_slot: meta_slot).exists? ||
      re_slots.active.where(meta_slot: meta_slot).exists?
  end

  ## friendship related ##

  # TODO: get friends with one query
  def friends
    friends_by_request + friends_by_offer
  end

  def friendships
    initiated_friendships.active + received_friendships.active
  end

  # def friend_with?(user_id)
  #   initiated_friendships.where("friend_id= ?", user_id).exists? ||
  #     received_friendships.where("user_id= ?", user_id).exists?
  # end

  def friendship(user_id)
    initiated_friendships.where("friend_id= ?", user_id).first ||
      received_friendships.where("user_id= ?", user_id).first
  end

  def offered_friendship(user_id)
    received_friendships.open.where("user_id= ?", user_id).first
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
    # Everything needs to stay available so that if user comes back all content
    # is still there
    # TODO: add spec

    # created_slots set creator to unknown /  deleted user
    # own_groups set creator to unknown /  deleted user
    # StdSlots
    # ReSlots

    slot_settings.each(&:delete)
    image.first.delete if image.first
    friendships.each(&:delete)
    memberships.each(&:delete)
    SoftDelete.call(self)
  end

  # TODO: add spec
  def undelete
    slot_settings.each(&:undelete)
  end
end
