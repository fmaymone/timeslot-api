class Membership < ActiveRecord::Base
  include GroupActivity

  after_commit AuditLog

  belongs_to :user, inverse_of: :memberships
  belongs_to :group, inverse_of: :memberships

  validates :user, presence: true
  validates :group, presence: true
  validates :state, presence: true
  validates :notifications, inclusion: [true, false] # makes sure it's not nil

  def activate
    create_activity
    update!(state: "111")
    user.follow(group)
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
    group.remove_follower(user)
    group.touch
  end

  def kicked?
    state == "010" && !deleted_at?
  end

  def leave
    update!(state: "100")
    user.unfollow(group)
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
    group.remove_follower(user)
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
    remove_activity
    update!(state: "000")
    group.remove_follower(user)
    user.touch
    group.touch unless group.deleted_at?
    ts_soft_delete
  end

  # def deleted?
  #   state == '000' && deleted_at?
  # end

  def humanize
    case state
    when "111" then "active"
    when "011" then "invited"
    when "001" then "refused"
    when "010" then "kicked"
    when "100" then "left"
    # when "101" then "subscribed"
    when "000" then "deleted"
    else "undefined"
    end
  end

  ## Activity Methods ##

  private

  def activity_is_valid?
    super and active?
  end

  def activity_target
    group
  end

  private def activity_foreign
    group.owner
  end

  # The user who made the update
  def activity_actor
    user
  end

  private def activity_notify
    []
  end

  def activity_action
    'membership'
  end
end
