class UserPolicy < ApplicationPolicy
  def index?
    current_user?
  end

  def show?
    current_user?
  end

  def create?
    true
  end

  def signin?
    true
  end

  def signout?
    current_user?
  end

  def update?
    current_user?
  end

  def add_friends?
    current_user?
  end

  def remove_friends?
    current_user?
  end

  def destroy?
    current_user?
  end
end
