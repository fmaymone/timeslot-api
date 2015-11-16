class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  # true if a user is logged in
  def show?
    current_user?
  end

  # true if a user is logged in
  # also true for visitors
  def media_items?
    current_user?
  end

  # no prerequisites
  def create?
    true
  end

  # true if a user with this email exists
  # however, if this wouldn't be the case the API
  # would already have returned a 404
  def signin?
    true
  end

  # true if a user is logged in
  def signout?
    current_user?
  end

  # seeing slots for a user is allowed for everybody including visitors
  # depending on the relationship between current_user and requested user
  # only specific slots may be visible, eg. public slots.
  # This is determined in the presentable slots service
  def slots?
    true
  end

  # true if a user is logged in
  def slots_from_friends?
    current_user?
  end

  # true if a user is logged in
  def update_device?
    current_user?
  end

  # true if a user with this email exists
  # however, if this wouldn't be the case the API
  # would already have returned a 404
  def reset_password?
    true
  end

  # true if a user is logged in
  def update?
    current_user?
  end

  # true if a user is logged in
  def add_friends?
    current_user?
  end

  # true if a user is logged in
  def remove_friends?
    current_user?
  end

  # true if a user is logged in
  def destroy?
    current_user?
  end
end
