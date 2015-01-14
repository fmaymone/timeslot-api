class Group < ActiveRecord::Base
  after_commit AuditLog
  after_create :add_owner_as_member, on: :create

  belongs_to :owner, class_name: "User", inverse_of: :own_groups
  # has_many relation because when image gets updated the old image still exists
  has_many :images, -> { where deleted_at: nil }, class_name: "MediaItem",
           as: :mediable

  has_many :group_slots, inverse_of: :group

  has_many :memberships, inverse_of: :group
  has_many :related_users, through: :memberships, class_name: "User",
           source: :user # includes all membership states

  has_many :active_memberships, -> { where state: '111' },
           class_name: "Membership"
  has_many :members, through: :active_memberships, class_name: "User",
           source: :user

  validates :name, presence: true, length: { maximum: 255 }
  validates :owner, presence: true

  def image
    images.first
  end

  def related_memberships
    Membership.includes([:user]).where(group_id: id)
  end

  def delete
    # all other images (if any) should already be "deleted"
    image.delete if images.first
    memberships.each(&:delete)
    group_slots.each(&:delete)
    SoftDelete.call(self)
  end

  private def add_owner_as_member
    Membership.create(group_id: id, user_id: owner.id).activate
  end
end
