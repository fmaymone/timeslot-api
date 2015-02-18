class GroupPolicy < ApplicationPolicy
  def index?
    current_user?
  end

  def show?
    return false unless current_user?
    return true if user.is_active_member? record.id
    false
  end

  def create?
    current_user?
  end

  def update?
    return false unless current_user?
    return true if user.is_owner? record.id
    false
  end

  def destroy?
    return false unless current_user?
    return true if user.is_owner? record.id
    false
  end

  def members?
    show?
  end

  def related?
    return false unless current_user?
    return true if user.is_owner? record.id
    false
  end

  def accept_invite?
    return false unless current_user?
    return true if user.is_invited? record.id
    false
  end

  def refuse_invite?
    return false unless current_user?
    return true if user.is_invited? record.id
    false
  end

  def invite?
    return false unless current_user?
    return true if user.is_owner? record.id
    return true if record.members_can_invite
    false
  end

  def leave?
    return false unless current_user?
    return true if user.get_membership(record.id)
    false
  end

  def kick?
    return false unless current_user?
    return true if user.get_membership(record.id)
    false
  end

  # same as show? ???
  def member_settings?
    return false unless current_user?
    return true if user.is_active_member? record.id
    false
  end
end
