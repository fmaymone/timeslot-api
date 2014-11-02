class Group < ActiveRecord::Base
  belongs_to :owner, class_name: "User", inverse_of: :own_groups
  has_one :image, class_name: "MediaItem", as: :mediable
  has_many :memberships, inverse_of: :group
  has_many :members, class_name: "User", through: :memberships

  validates :name, presence: true
  validates :owner, presence: true
end
