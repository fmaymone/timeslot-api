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

  # true if current user is an active group member
  def show?
    return false unless current_user?
    return true if current_user.is_active_member? group.id
    false
  end

  # true if the user is logged in
  def create?
    current_user?
  end

  # true if current user is the group owner
  def update?
    return false unless current_user?
    return true if current_user.is_owner? group.id
    false
  end

  def destroy?
    update?
  end

  def members?
    show?
  end

  def related?
    update?
  end

  # true if current user has an invitation to the group
  def accept_invite?
    return false unless current_user?
    return true if current_user.is_invited? group.id
    false
  end

  def refuse_invite?
    accept_invite?
  end

  # true if current user is the group owner
  # true if current user is an active member of the group and members can invite
  def invite?
    return false unless current_user?
    return false unless current_user.is_active_member? group.id
    return true if current_user.is_owner? group.id
    return true if group.members_can_invite
    false
  end

  # true if current user is a member of the group and members can invite
  def leave?
    return false unless current_user?
    return true if current_user.get_membership(group.id)
    false
  end

  # true if current user is related to the group
  def kick?
    return false unless current_user?
    return true if current_user.get_membership(group.id)
    false
  end

  def member_settings?
    show?
  end
end
