class Group < ActiveRecord::Base
  after_commit AuditLog

  belongs_to :owner, class_name: "User", inverse_of: :own_groups
  has_many :image, -> { where deleted_at: nil }, class_name: "MediaItem",
          as: :mediable

  has_many :group_slots, inverse_of: :group

  has_many :memberships, inverse_of: :group
  has_many :related_users, through: :memberships, class_name: "User",
           source: :user # includes all membership states

  has_many :active_memberships, -> { where state: '111' },
           class_name: "Membership"
  has_many :members, through: :active_memberships, class_name: "User",
           source: :user

  validates :name, presence: true
  validates :owner, presence: true

  # TODO: add spec
  def delete
    # TODO: take care of Memberships, related GroupSlots, Group Image
    # can a group with the same name be created after "deletion"?
    update!(name: Time.zone.now.to_s + name) # what if max length in db surpassed
    image.first.delete if image.first
    # image.delete
    memberships.delete
    group_slots.delete
    SoftDelete.call(self)
  end
end
