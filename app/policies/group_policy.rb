class GroupPolicy < ApplicationPolicy
  attr_reader :user, :group

  def initialize(user, group)
    @user = user
    @group = group
  end

  def index?
    current_user?
  end

  def show?
    return false unless current_user?
    return true if user.is_active_member? group.id
    false
  end

  def create?
    current_user?
  end

  def update?
    return false unless current_user?
    return true if user.is_owner? group.id
    false
  end

  def destroy?
    return false unless current_user?
    return true if user.is_owner? group.id
    false
  end

  def members?
    show?
  end

  def related?
    return false unless current_user?
    return true if user.is_owner? group.id
    false
  end

  def accept_invite?
    return false unless current_user?
    return true if user.is_invited? group.id
    false
  end

  def refuse_invite?
    return false unless current_user?
    return true if user.is_invited? group.id
    false
  end

  def invite?
    return false unless current_user?
    return true if user.is_owner? group.id
    return true if group.members_can_invite
    false
  end

  def leave?
    return false unless current_user?
    return true if user.get_membership(group.id)
    false
  end

  def kick?
    return false unless current_user?
    return true if user.get_membership(group.id)
    false
  end

  # same as show? ???
  def member_settings?
    return false unless current_user?
    return true if user.is_active_member? group.id
    false
  end
end
