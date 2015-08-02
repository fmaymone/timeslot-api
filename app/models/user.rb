class User < ActiveRecord::Base
  include TS_Role
  has_secure_password validations: false

  # allows a user to be signed in after sign up
  before_create :set_auth_token
  after_commit AuditLog

  ## associations ##

  # has_many relation because when image gets updated the old image still exists
  has_many :images, -> { where deleted_at: nil }, class_name: MediaItem,
           as: :mediable

  has_many :media_items, -> { where deleted_at: nil }, class_name: MediaItem, as: :mediable,
           foreign_key: :creator_id, inverse_of: :creator

  has_many :created_slots, class_name: MetaSlot,
           foreign_key: :creator_id, inverse_of: :creator

  has_many :slot_settings, inverse_of: :user

  # also returns deleted slots
  has_many :std_slots, foreign_key: :owner_id, inverse_of: :owner

  has_many :std_slots_private, class_name: StdSlotPrivate,
           foreign_key: :owner_id, inverse_of: :owner
  has_many :std_slots_friends, class_name: StdSlotFriends,
           foreign_key: :owner_id, inverse_of: :owner
  has_many :std_slots_public, class_name: StdSlotPublic,
           foreign_key: :owner_id, inverse_of: :owner

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

  # settings
  belongs_to :location, class_name: IosLocation
  accepts_nested_attributes_for :location, reject_if: :all_blank
  # has_one :slot_default_location, class_name: Location
  # has_one :slot_default_type, class_name: SlotType

  ## validations ##

  validates :username, presence: true, length: { maximum: 50 }

  # http://davidcel.is/blog/2012/09/06/stop-validating-email-addresses-with-regex/
  validates :email,
            length: { maximum: 254 },
            uniqueness: { case_sensitive: false },
            format: { with: /.+@.+\..{1,63}/, message: "invalid email address" },
            allow_nil: true # if: 'self.email'

  # because bcrypt MAX_PASSWORD_LENGTH_ALLOWED = 72
  validates :password, length: { minimum: 5, maximum: 72 }, allow_nil: true

  validates_numericality_of :slot_default_duration,
                            only_integer: true,
                            allow_nil: true
  validates :phone,
            uniqueness: true,
            length: { maximum: 35 },
            allow_nil: true

  ## user specific ##

  def update_with_image(params: nil, image: nil)
    update(params.except("public_id")) if params
    AddImage.call(self, image["public_id"], image["local_id"]) if image
    self
  end

  def image
    images.first
  end

  def sign_out
    update!(auth_token: nil)
  end

  def reset_password
    new_password = SecureRandom.urlsafe_base64(6)
    update(password: new_password)
    set_auth_token

    begin
      ses = Aws::SES::Client.new
      ses.send_email(
        source: "support@timeslot.com",
        destination: {
          to_addresses: [email]
        },
        message: {
          subject: {
            data: "Your new Password for Timeslot",
            # charset: "Charset",
          },
          body: {
            text: {
              data: "Your new timeslot password: #{new_password}",
              # charset: "Charset",
            },
            html: {
              data: "<h3>Your new timeslot password</h3>" \
                    "<p>#{new_password}</p>",
              # charset: "Charset",
            }
          }
        },
        reply_to_addresses: ["passwords@timeslot.com"],
        return_path: "invalid_email_address@timeslot.com"
      )
    rescue Aws::SES::Errors::ServiceError => exception
      Rails.logger.error exception
      Airbrake.notify(aws_sns_error: exception)
      raise exception if Rails.env.test? || Rails.env.development?
    end
  end

  def connect_or_merge(identity_params, social_params)
    identity = Connect.where(social_id: identity_params[:social_id],
                             provider: identity_params[:provider]).take

    user = User.find_by email: social_params[:email] if social_params[:email]

    if identity
      msg = 'social account already connected to other timeslot account'
      errors.add(:connect, msg) unless self == identity.user
    elsif user && self != user
      msg = 'social email already used by other timeslot account'
      errors.add(:connect, msg)
    else
      identity = Connect.create(user: self,
                                social_id: identity_params[:social_id],
                                provider: identity_params[:provider],
                                data: social_params)

      if identity.errors.any?
        errors.add(:connect, identity.errors)
      elsif social_params[:email] and email.nil?
        update(email: social_params[:email])
      end
    end
  end

  def set_auth_token
    self.auth_token = self.class.generate_auth_token
  end

  def inactivate
    # Everything needs to stay available so that if user comes back all content
    # is still there
    # TODO: add spec

    # set social connects to deleted
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

  ## media related ##

  def media_for(current_user)
    medias = []
    if self == current_user
      # Get all owned media items of current user:
      medias = MediaItem.where(creator_id: current_user.id)
      # Why this association does not work?: medias = current_user.media_items
    else
      # Get all public media items of specific user (also for guests):
      std_slots_public.each do |slot|
        medias += slot.media_items
      end
      # Get all friendship related media items:
      if self.friend_with?(current_user)
        std_slots_friends.each do |slot|
          medias += slot.media_items
        end
      end
      # Get all group related media items:
      # TODO: can visitors also have access to media items of public group slots?
      group_slots.where('group_slots.group_id IN (?)', current_user.groups.ids).each do |slot|
        medias += slot.media_items
      end
    end
    medias.sort_by(&:position)
  end

  ## slot related ##

  def active_slots(meta_slot)
    # TODO
    # std_slots.active + re_slots.active + group_slots.active
    slots = []
    slots.push(*std_slots_private.active.where(meta_slot: meta_slot))
    # slots.push(*StdSlot.active.of(self).where(meta_slot: meta_slot))
    slots.push(*group_slots.active.where(meta_slot: meta_slot))
    slots.push(*re_slots.active.where(meta_slot: meta_slot))
  end

  def shared_group_slots(user)
    group_slots.merge(groups.where('groups.id IN (?)', user.groups.ids))
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

  def friend_with?(user)
    friendship(user.id).try(:established?)
  end

  ## group related ##

  def owner?(group)
    self == group.owner
  end

  def get_membership(group_id)
    memberships.find_by group_id: group_id
  end

  def invited?(group_id)
    membership = get_membership group_id
    !membership.nil? && membership.invited?
  end

  def active_member?(group_id)
    membership = get_membership group_id
    !membership.nil? && membership.active?
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

  def update_member_settings(params, group_id)
    membership = get_membership group_id
    membership && membership.update(params)
    membership
  end

  # ordered by start_date of the next group slot
  def groups_ordered
    groups.includes(group_slots: :meta_slot).order('meta_slots.start_date')
  end

  ## private methods ##

  private def default_alert?(slot, alerts)
    alerts == default_alert(slot)
  end

  private def default_alert(slot)
    case slot
    when StdSlotPrivate
      default_private_alerts
    when StdSlotFriends
      default_own_friendslot_alerts
    when StdSlotPublic
      default_own_public_alerts
    # TODO: add friends friendslot
    # TODO: add friends publicslot
    when ReSlotFriends
      default_reslot_alerts
    when ReSlotPublic
      default_reslot_alerts
    when GroupSlotMembers
      group_alert slot
    when GroupSlotPublic
      group_alert slot
    when ReSlot
      # TODO: change this
      default_reslot_alerts
    when GroupSlot
      # TODO: change this
      group_alert slot
    when StdSlot
      p 'std slot in alerts'
      default_private_alerts
    else
      msg = "unknown slottype #{slot} for user #{self}"
      Airbrake.notify(msg)
      fail ActiveRecord::StatementInvalid, msg
    end
  end

  private def group_alert(slot)
    membership = memberships.find_by(group_id: slot.group.id)

    if membership.try(:default_alerts)
      membership.default_alerts
    elsif !membership.nil?
      default_group_alerts
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
    representations.push(*std_slots_private.where(meta_slot: slot.meta_slot))
    representations.push(*std_slots_friends.where(meta_slot: slot.meta_slot))
    representations.push(*std_slots_public.where(meta_slot: slot.meta_slot))
    representations.push(*re_slots.where(meta_slot: slot.meta_slot))
    representations.push(*group_slots.where(meta_slot: slot.meta_slot))
  end

  ## class methods ##

  # technically this is not neccessary bc it's not possible to set an image on
  # signup, at least in the ios app right now
  def self.create_with_image(params:, image: nil)
    new_user = create(params)
    return new_user unless new_user.errors.empty?

    AddImage.call(new_user, image["public_id"], image["local_id"]) if image
    new_user
  end

  def self.create_or_signin_via_social(identity_params, social_params)
    identity = Connect.where(social_id: identity_params[:social_id],
                             provider: identity_params[:provider]).take
    if identity
      no_token = identity.user.auth_token.nil?
      identity.user.update(auth_token: generate_auth_token) if no_token
      return identity.user
    end

    user = detect_or_create(identity_params[:username], social_params[:email])
    return user unless user.errors.empty?
    user.update(auth_token: generate_auth_token) unless user.auth_token

    identity = Connect.create(user: user,
                              provider: identity_params[:provider],
                              social_id: identity_params[:social_id],
                              data: social_params)

    user.errors.add(connect: identity.errors) if identity.errors.any?
    user
  end

  # Issue to be decided upon later but for now we keep this behaviour:
  # If there is a timeslot account with an unverified email address and another
  # user tries to log in with facebook and has this email verified in facebook,
  # the other user can not log in via facebook (gets 422)
  def self.detect_or_create(username, email)
    user = User.find_by email: email if email
    if user
      msg = "#{email} is already used by other timeslot user (unverified email)"
      Airbrake.notify(msg)
      fail ActiveRecord::StatementInvalid, msg unless user.email_verified
    end
    user || User.create(username: username, email: email)
  end

  def self.sign_in(email: nil, phone: nil, password:)
    if email
      user = User.find_by email: email
    elsif phone
      user = User.find_by phone: phone
    end
    current_user = user.try(:authenticate, password)
    current_user.update(auth_token: generate_auth_token) if current_user
    current_user
  end

  def self.generate_auth_token
    SecureRandom.urlsafe_base64(20)
  end
end
