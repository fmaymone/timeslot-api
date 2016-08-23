class GroupPolicy < ApplicationPolicy
  attr_reader :current_user, :group

  def initialize(user, group)
    @current_user = user
    @group = group
  end

  # true if the user is logged in
  def index?
    current_user?
  end

  # true if the group/calendar is public
  # true if current user is an active group member
  def show?
    return true if group.public?
    active_group_member?
  end

  # true if the user is logged in
  def create?
    current_user?
  end

  # true if current user is the group owner
  def update?
    return false unless current_user?
    return true if current_user == group.owner
    return true if current_user.owner? group
    false
  end

  def destroy?
    return false unless current_user?
    return false if current_user.slot_sets.values.include? group.uuid
    update?
  end

  def slots?
    show?
  end

  def dates?
    show?
  end

  def members?
    show?
  end

  def related?
    update?
  end

  # true if the current user is an active member of the group
  def add_slot?
    return false unless current_user?
    return true if current_user == group.owner
    return true if current_user.active_member? group
    false
  end

  # true if the current_user is the owner of the group
  # TODO: true if the current_user has added the slot to the group
  def remove_slot?
    return false unless current_user?
    return true if current_user == group.owner
    return true if current_user.active_member? group.id
    false
  end

  # true if current user has an invitation to the group
  def accept_invite?
    return false unless current_user?
    return true if current_user.invited? group.id
    false
  end

  def refuse_invite?
    accept_invite?
  end

  # true if slotgroup/calendar is public and
  # a user is signed in
  def subscribe?
    return false unless current_user?
    return false unless group.public?
    true
  end

  # true if current user is the group owner
  # true if current user is an active member of the group and members can invite
  def invite?
    return false unless current_user?
    return true if current_user.owner? group
    return false unless current_user.active_member? group.id
    return true if group.members_can_invite
    false
  end

  def leave?
    active_group_member?
  end

  # true if current user is an active member of the group
  # true if current user is invited to the group
  def kick?
    return false unless current_user?
    return true if current_user.active_member? group.id
    return true if current_user.invited? group.id
    false
  end

  def member_settings?
    active_group_member?
  end

  # true if current user is an active member of the group
  def add_calendar_to_schedule?
    return false unless current_user?
    return true if current_user.active_member? group.id
    false
  end

  # true if current user is an active member of the group
  def remove_calendar_from_schedule?
    return false unless current_user?
    return true if current_user.active_member? group.id
    false
  end

  # true if the group is public and
  # belongs to a global slot category
  def global_group?
    return false unless group.public?
    return true if group.owner.global_slot_category?
    false
  end

  private def active_group_member?
    return false unless current_user?
    return true if current_user.id == group.owner_id
    return true if current_user.active_member? group.id
    false
  end
end
