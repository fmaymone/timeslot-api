class User < ActiveRecord::Base
  after_commit AuditLog

  # has_many relation because when image gets updated the old image still exists
  has_many :images, -> { where deleted_at: nil }, class_name: MediaItem,
          as: :mediable

  has_many :created_slots, class_name: MetaSlot,
           foreign_key: "creator_id", inverse_of: :creator

  has_many :slot_settings, inverse_of: :user

  # TODO: I think I don't need this, remove after alarm stuff is in place
  # has_many :meta_slots, through: :slot_settings, source: :meta_slot

  # also returns deleted slots
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

  validates :username, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :email, presence: true, length: { maximum: 254 },
            uniqueness: { case_sensitive: false },
            format: { with: /.+@.+\..{1,63}/, message: "invalid email address" }
  # http://davidcel.is/blog/2012/09/06/stop-validating-email-addresses-with-regex/

  ## user related ##

  def change(params)
    update(params.except("public_id"))
    AddImage.call(self, params["public_id"]) if params["public_id"].present?
    self
  end

  def image
    images.first
  end

  ## slot related ##

  def active_slots(meta_slot)
    slots = []
    slots.push(*std_slots.active.where(meta_slot: meta_slot))
    slots.push(*group_slots.active.where(meta_slot: meta_slot))
    slots.push(*re_slots.active.where(meta_slot: meta_slot))
  end

  # including deleted slots
  def all_slots
    slots = []
    slots.push(*std_slots)
    slots.push(*group_slots)
    slots.push(*re_slots)
  end

  def prepare_for_slot_deletion(slot)
    alert = slot_settings.where(meta_slot: slot.meta_slot).first
    return if alert.nil?
    alert.delete if active_slots(slot.meta_slot).size <= 1
  end

  def update_alerts(slot, alerts)
    alert = slot_settings.where(meta_slot: slot.meta_slot).first
    if alert.nil?
      return if default_alert?(slot, alerts)
      SlotSetting.create(user: self, meta_slot: slot.meta_slot, alerts: alerts)
    else
      alert.update(alerts: alerts)
    end
  end

  def alerts(slot)
    setting = SlotSetting.where(user: self, meta_slot: slot.meta_slot)
    if setting.exists?
      setting.first.alerts
    else
      default_alert(slot)
    end
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
    membership = get_membership group_id
    !membership.nil? && membership.invited?
  end

  def can_invite?(group_id)
    group = Group.find(group_id)
    self == group.owner || group.members_can_invite
  end

  def accept_invite(group_id)
    membership = get_membership group_id
    membership && membership.activate
  end

  def refuse_invite(group_id)
    membership = get_membership group_id
    membership && membership.refuse
  end

  def leave_group(group_id)
    membership = get_membership group_id
    membership && membership.leave
  end

  def is_active_member?(group_id)
    membership = get_membership group_id
    !membership.nil? && membership.active?
  end

  def is_owner?(group_id)
    group = Group.find(group_id)
    self == group.owner
  end

  def get_membership(group_id)
    memberships.find_by group_id: group_id
  end

  def update_member_settings(params, group_id)
    membership = get_membership group_id
    membership && membership.update(params)
    membership
  end

  def inactivate
    # Everything needs to stay available so that if user comes back all content
    # is still there
    # TODO: add spec

    # created_slots set creator to unknown /  deleted user
    # own_groups set creator to unknown /  deleted user
    # StdSlots
    # ReSlots

    slot_settings.each(&:delete)
    image.delete if images.first
    friendships.each(&:inactivate)
    memberships.each(&:inactivate)
    ts_soft_delete
  end

  # TODO: add spec
  def activate
    slot_settings.each(&:undelete)
  end

  private def default_alert?(slot, alerts)
    if slot.class == GroupSlot
      alerts == memberships.find_by(group_id: slot.group.id).default_alerts
    else
      alerts == default_alerts
    end
  end

  private def default_alert(slot)
    if slot.class == GroupSlot
      membership = memberships.find_by(group_id: slot.group.id)
      if !membership.nil? && !membership.default_alerts.nil?
        return membership.default_alerts
      end
    end
    default_alerts
  end

  def self.add(params)
    new_user = create(params.except("public_id"))
    return new_user unless new_user.errors.empty?
    AddImage.call(new_user, params["public_id"]) if params["public_id"].present?
    new_user
  end
end
