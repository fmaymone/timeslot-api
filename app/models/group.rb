class Group < ActiveRecord::Base
  after_commit AuditLog
  after_create :add_owner_as_member, on: :create

  belongs_to :owner, class_name: User, inverse_of: :own_groups
  # has_many relation because when image gets updated the old image still exists
  has_many :images, -> { where deleted_at: nil }, class_name: MediaItem,
           as: :mediable

  has_many :group_slots, inverse_of: :group

  has_many :memberships, inverse_of: :group
  has_many :related_users, through: :memberships, class_name: User,
           source: :user # includes all membership states

  has_many :active_memberships, -> { where state: '111' },
           class_name: Membership
  has_many :members, through: :active_memberships, class_name: User,
           source: :user

  validates :name, presence: true, length: { maximum: 255 } # screens have max length of 25
  validates :owner, presence: true

  def image
    images.first
  end

  def update_with_image(params)
    update(params.except("public_id"))
    AddImage.call(self, params["public_id"]) if params["public_id"].present?
    self
  end

  def related_memberships
    Membership.includes([:user]).where(group_id: id)
  end

  def invite_users(ids)
    ids.each do |user_id|
      invitee = User.find(user_id)
      next if invitee.invited?(id) || invitee.is_active_member?(id)

      # allow to re-invite kicked/refused/left members:
      membership = invitee.get_membership self
      membership ||= Membership.new(group_id: id, user_id: invitee.id)
      membership.invite && membership.save
    end
  end

  def kick_member(user_id)
    membership = memberships.find_by user_id: user_id
    membership && membership.kick
  end

  def delete
    owner.touch
    # all other images (if any) should already be "deleted"
    image.delete if images.first
    memberships.each(&:delete)
    group_slots.each(&:delete)
    ts_soft_delete
  end

  private def add_owner_as_member
    Membership.create(group_id: id, user_id: owner.id).activate
  end

  def self.create_with_image(params)
    new_group = create(params.except("public_id"))
    return new_group unless new_group.errors.empty?
    AddImage.call(new_group, params["public_id"]) if params["public_id"].present?
    new_group
  end
end
