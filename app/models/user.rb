class User < ActiveRecord::Base
  include TS_Role

  has_secure_password validations: false
  before_save :set_auth_token, if: 'self.password'
  after_commit AuditLog

  # has_many relation because when image gets updated the old image still exists
  has_many :images, -> { where deleted_at: nil }, class_name: MediaItem,
          as: :mediable

  has_many :created_slots, class_name: MetaSlot,
           foreign_key: "creator_id", inverse_of: :creator

  has_many :slot_settings, inverse_of: :user

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
  # TODO: what about a minimum for username?
  validates :email, presence: true, length: { maximum: 254 },
            uniqueness: { case_sensitive: false },
            format: { with: /.+@.+\..{1,63}/, message: "invalid email address" }
  # http://davidcel.is/blog/2012/09/06/stop-validating-email-addresses-with-regex/

  # because bcrypt MAX_PASSWORD_LENGTH_ALLOWED = 72
  validates :password, length: { minimum: 5, maximum: 72 }, if: "self.password"
  validate :password_digest_was_created, on: :create

  ## user related ##

  def update_with_image(params)
    update(params.except("public_id"))
    AddImage.call(self, params["public_id"]) if params["public_id"].present?
    self
  end

  def image
    images.first
  end

  def sign_out
    update!(auth_token: nil)
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
    # TODO: add slots from friends
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
      setting.take.alerts
    else
      representations = multiple_representations(slot)
      merge_alerts(representations)
    end
  end

  ## friendship related ##

  # OPTIMIZATION: get friends with one query
  def friends
    friends_by_request + friends_by_offer
  end

  def friendships
    initiated_friendships.active + received_friendships.active
  end

  def friendship(user_id)
    initiated_friendships.where("friend_id= ?", user_id).first ||
      received_friendships.where("user_id= ?", user_id).first
  end

  def offered_friendship(user_id)
    received_friendships.open.where("user_id= ?", user_id).first
  end

  def add_friends(user_ids)
    user_ids.each do |id|
      if offered_friendship(id).try(:accept)
        next
      elsif friendship(id).nil?
        requested_friends << User.find(id)
      end
    end
  end

  def remove_friends(user_ids)
    user_ids.each do |id|
      friendship(id).try(:inactivate)
    end
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
    ts_soft_delete and return self
  end

  # TODO: add spec
  def activate
    slot_settings.each(&:undelete)
  end

  private def default_alert?(slot, alerts)
    if slot.class == StdSlot
      return alerts == default_private_alerts if slot.private?
      return alerts == default_own_friendslot_alerts if slot.friendslot?
      return alerts == default_own_public_alerts if slot.public?
      # TODO: add friends friendslot
      # TODO: add friends publicslot
    elsif slot.class == GroupSlot
      ms = memberships.find_by(group_id: slot.group.id)
      default_membership_alerts = ms.try(:default_alerts)
      return alerts == default_group_alerts if default_membership_alerts.nil?
      return alerts == default_membership_alerts
    elsif slot.class == ReSlot
      return alerts == default_reslot_alerts
    end
    false
  end

  private def default_alert(slot)
    if slot.class == StdSlot
      return default_private_alerts if slot.private?
      return default_own_friendslot_alerts if slot.friendslot?
      return default_own_public_alerts if slot.public?
      # TODO: add friends friendslot
      # TODO: add friends publicslot
    elsif slot.class == GroupSlot
      membership = memberships.find_by(group_id: slot.group.id)
      if !membership.nil? && !membership.default_alerts.nil?
        return membership.default_alerts
      elsif !membership.nil?
        return default_group_alerts
      end
    elsif slot.class == ReSlot
      return default_reslot_alerts
    end
  end

  # combines alerts from all slot representations via logical OR
  private def merge_alerts(representations)
    alert = 0
    representations.each do |slot|
      alert |= default_alert(slot).to_i(2)
    end
    alert.to_s(2).rjust(10, '0')
  end

  private def multiple_representations(slot)
    representations = []
    representations.push(*std_slots.where(meta_slot: slot.meta_slot))
    representations.push(*re_slots.where(meta_slot: slot.meta_slot))
    representations.push(*group_slots.where(meta_slot: slot.meta_slot))
  end

  private def set_auth_token
    self.auth_token = generate_auth_token
  end

  private def generate_auth_token
    SecureRandom.urlsafe_base64(20)
  end

  private def password_digest_was_created
    errors.add(:password, "Password missing") if password_digest.nil?
  end

  def self.create_with_image(params)
    new_user = create(params.except("public_id"))
    return new_user unless new_user.errors.empty?
    AddImage.call(new_user, params["public_id"]) if params["public_id"].present?
    new_user
  end

  def self.sign_in(email, password)
    user = User.find_by email: email
    user.try(:authenticate, password)
  end
end
