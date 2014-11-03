class User < ActiveRecord::Base
  default_scope { where("displayed IS true") }

  has_many :own_groups, class_name: "Group", inverse_of: :owner
  has_many :memberships, inverse_of: :user
  has_many :groups, through: :memberships

  validates :username, presence: true, length: { maximum: 20 }
end
