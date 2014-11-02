class Membership < ActiveRecord::Base
  belongs_to :user, inverse_of: :memberships
  belongs_to :group, inverse_of: :memberships
  has_many :membership_states, inverse_of: :membership

  validates :user, presence: true
  validates :group, presence: true
  validates :state, presence: true
end
