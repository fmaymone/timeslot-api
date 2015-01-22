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
    group.touch
  end

  def active?
    state == "111" && !deleted_at?
  end

  def invite
    update!(state: "011")
  end

  def invited?
    state == "011" && !deleted_at?
  end

  def refuse
    update!(state: "001")
  end

  def refused?
    state == "001" && !deleted_at?
  end

  def kick
    update!(state: "010")
    group.touch
  end

  def kicked?
    state == "010" && !deleted_at?
  end

  def leave
    update!(state: "100")
    group.touch
  end

  def left?
    state == "100" && !deleted_at?
  end

  # def subscribe
  #   update!(state: "101")
  # end

  # def subscribed?
  #   state == "101" && !deleted_at?
  # end

  # called if user deactivates his account
  # state needs to be preserved in this case
  def inactivate
    group.touch
    ts_soft_delete
  end

  # group still existing
  def inactive?
    state != "000" && deleted_at?
  end

  # called when belonging group gets deleted
  # group can't come back so we can't use this membership object again
  # and thus don't need the state
  def delete
    update!(state: "000")
    user.touch
    ts_soft_delete
  end

  # def deleted?
  #   state == '000' && deleted_at?
  # end
end
