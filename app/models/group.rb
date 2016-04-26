# trying to fix the following load error
# Circular dependency detected while autoloading constant Feed (RuntimeError)
# I guess it's only happening in tests, so limiting it until further need
require_dependency "Feed" if Rails.env.test?

class Group < ActiveRecord::Base
  include Follow
  before_create :set_uuid
  after_commit AuditLog

  before_validation :strip_whitespaces
  after_create :add_owner_as_member, on: :create

  # scope :public is defined at class method, was not possible otherwise
  scope :non_public, -> { where(public: false) }

  belongs_to :owner, class_name: User, inverse_of: :own_groups

  has_many :containerships, inverse_of: :group
  has_many :slots, -> { merge Containership.active },
           through: :containerships, source: :slot,
           inverse_of: :slot_groups

  has_many :memberships, inverse_of: :group
  # includes all membership states
  has_many :related_users, through: :memberships, source: :user

  has_many :active_memberships, -> { merge Membership.active },
           class_name: Membership
  has_many :members, through: :active_memberships, source: :user

  validates :name, presence: true, length: { maximum: 255 }
  validates :owner, presence: true

  def related_memberships
    Membership.includes([:user]).where(group_id: id)
  end

  def slots_with_associations
    slots.includes([:likes, :comments,
                    media_items: [:creator, :mediable],
                    meta_slot: [:creator],
                    notes: [:creator]])
  end

  def add_slots(muids)
    muids.each do |muid|
      slot = GlobalSlot.find_or_create(muid)
      Containership.find_or_create_by(slot: slot, group: self)
      # NOTE: no activity required,
      # this method is only used to add global slots to a global group
    end
  end

  def invite_users(ids, initiator = nil)
    ids.each do |user_id|
      invitee = User.find(user_id)
      next if invitee.active_member?(id)

      # allow to re-invite kicked/refused/left members:
      membership = invitee.get_membership self
      membership ||= Membership.new(group_id: id, user_id: invitee.id)
      membership.activate(initiator) && membership.save
    end
  end

  def kick_member(user_id)
    membership = memberships.find_by user_id: user_id
    return true unless membership # return 200 if user not member, could be improved
    membership && membership.kick
  end

  def delete
    owner.touch
    memberships.includes(:user).each(&:delete)
    # NOTE: Groups do not include Activity, but we can call feed methods directly:
    Feed.remove_target_from_feeds(target: self, type: 'Group', notify: self.followers)
    containerships.each(&:delete)
    ts_soft_delete
    # NOTE: Remove follower relations at least!
    remove_all_followers
  end

  private def add_owner_as_member
    Membership.create(group_id: id, user_id: owner.id, state: '111')
  end

  private def strip_whitespaces
    self.name.squish! if self.name
  end

  private def set_uuid
    self.uuid ||= self.class.generate_uuid
  end

  def self.generate_uuid
    SecureRandom.uuid
  end

  def self.create_with_invitees(group_params:, invitees: nil, initiator: nil)
    new_group = create(group_params)
    return new_group unless new_group.errors.empty?

    # set defaults if not specified
    if !new_group.public? && !(group_params.key? :members_can_post)
      new_group.update(members_can_post: true)
    elsif new_group.public? && !(group_params.key? :members_can_invite)
      new_group.update(members_can_invite: true)
    end

    new_group.invite_users(invitees, initiator) if invitees
    new_group
  end

  def self.public
    where(public: true)
  end
end
