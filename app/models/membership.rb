class Membership < ActiveRecord::Base
  belongs_to :user, inverse_of: :memberships
  belongs_to :group, inverse_of: :memberships
  # has_many :state_changes

  validates :user, presence: true
  validates :group, presence: true
  validates :state, presence: true
end
