class Membership < ActiveRecord::Base
  belongs_to :user, inverse_of: :memberships
  belongs_to :group, inverse_of: :memberships

  validates :user, presence: true
  validates :group, presence: true
  validates :state, presence: true
  validates :notifications, inclusion: { in: [true, false] }

  def activate
    update!(state: "111")
  end

  def active?
    state == "111"
  end

  def inactivate
    update!(state: "000")
  end

  def inactive?
    state == "000"
  end

  def invite
    update!(state: "011")
  end

  def invited?
    state == "011"
  end

  def refuse
    update!(state: "001")
  end

  def refused?
    state == "001"
  end

  def kick
    update!(state: "010")
  end

  def kicked?
    state == "010"
  end

  # def subscribe
  #   update!(state: "101")
  # end

  # def subscribed?
  #   state == "101"
  # end
end
