class Group < ActiveRecord::Base
  include Follow
  before_create :set_uuid
  after_commit AuditLog

  after_create :add_owner_as_member, on: :create

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
    end
  end

  def invite_users(ids)
    ids.each do |user_id|
      invitee = User.find(user_id)
      next if invitee.active_member?(id)

      # allow to re-invite kicked/refused/left members:
      membership = invitee.get_membership self
      membership ||= Membership.new(group_id: id, user_id: invitee.id)
      membership.activate && membership.save
    end
  end

  def kick_member(user_id)
    membership = memberships.find_by user_id: user_id
    return true unless membership # return 200 if user not member, could be improved
    membership && membership.kick
  end

  def delete
    remove_all_followers
    owner.touch
    memberships.includes(:user).each(&:delete)
    # containerships.includes(:slot).each(&:delete)
    containerships.each(&:delete)
    ts_soft_delete
  end

  private def add_owner_as_member
    Membership.create(group_id: id, user_id: owner.id, state: '111')
  end

  private def set_uuid
    self.uuid ||= self.class.generate_uuid
  end

  def self.generate_uuid
    SecureRandom.uuid
  end

  def self.create_with_invitees(group_params:, invitees: nil)
    new_group = create(group_params)
    return new_group unless new_group.errors.empty?

    new_group.invite_users(invitees) if invitees
    new_group
  end
end
