class Group < ActiveRecord::Base
  belongs_to :owner, class_name: "User", inverse_of: :own_groups
  has_one :image, class_name: "MediaItem", as: :mediable, dependent: :destroy

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
end
