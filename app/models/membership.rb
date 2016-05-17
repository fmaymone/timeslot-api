class Membership < ActiveRecord::Base
  include GroupActivity

  after_commit AuditLog

  scope :show_slots, -> { where(show_slots_in_schedule: true) }
  scope :active, -> { where(deleted_at: nil, state: '111') }

  belongs_to :user, inverse_of: :memberships
  belongs_to :group, inverse_of: :memberships

  validates :user, presence: true
  validates :group, presence: true
  validates :state, presence: true
  validates :notifications, inclusion: [true, false] # makes sure it's not nil

  attr_accessor :initiator

  @initiator = nil

  def activate(initiator = nil)
    remove_activity
    update!(state: "111")
    user.follow(group)
    @initiator = initiator
    create_activity
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
    update_activity('reject')
    true
  end

  def refused?
    state == "001" && !deleted_at?
  end

  def kick
    update_activity('kick')
    reduce_distribution_by{
      update!(state: "010")
      group.remove_follower(user)
    }
    group.slots.each(&:reduce_distribution_by)
    group.touch
  end

  def kicked?
    state == "010" && !deleted_at?
  end

  def leave
    update_activity('leave')
    reduce_distribution_by{
      update!(state: "100")
      user.unfollow(group)
    }
    group.slots.each(&:reduce_distribution_by)
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
    remove_activity
    reduce_distribution_by{
      group.remove_follower(user)
      group.touch
      ts_soft_delete
    }
    group.slots.each(&:reduce_distribution_by)
    true
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
    reduce_distribution_by{
      update!(state: "000")
      group.remove_follower(user)
      user.touch
      group.touch unless group.deleted_at?
      ts_soft_delete
    }
    group.slots.each(&:reduce_distribution_by)
    true
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

  private def activity_target
    group
  end

  private def activity_actor
    @initiator || user
  end

  private def activity_foreign
    @initiator ? user : super
  end

  private def activity_action
    @initiator ? 'membertag' : 'membership'
  end

  private def activity_is_valid?(action)
    super and active?
  end
end
