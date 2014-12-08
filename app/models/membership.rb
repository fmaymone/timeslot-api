class Membership < ActiveRecord::Base
  after_commit AuditLog

  belongs_to :user, inverse_of: :memberships
  belongs_to :group, inverse_of: :memberships

  validates :user, presence: true
  validates :group, presence: true
  validates :state, presence: true
  validates :notifications, inclusion: [true, false] # makes sure it's not nil

  def activate
    update!(state: "111")
  end

  def active?
    state == "111"
  end

  # if user deactivates his account
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

  # member leaves group
  def leave
    update!(state: "100")
  end

  def left?
    state == "100"
  end

  # def subscribe
  #   update!(state: "101")
  # end

  # def subscribed?
  #   state == "101"
  # end

  # TODO: add spec
  # called when belonging group gets deleted
  # group can't come back so we can't use this membership object again
  def delete
    SoftDelete.call(self)
  end
end
