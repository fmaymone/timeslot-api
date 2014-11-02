class MembershipState < ActiveRecord::Base
  belongs_to :membership, inverse_of: :membership_states

  validates :membership_id, presence: true
  validates :state, presence: true
end
