class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, other_user)
    @current_user = current_user
    @user = other_user
  end

  # true if a user is logged in
  # TODO: also allow for visitors?
  def show?
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

  # seeing slots for a user is allowed for everybody including visitors
  # depending on the relationship between current_user and requested user
  # only specific slots may be visible, eg. public slots.
  # This is determined in the presentable slots service
  def slots?
    true
  end

  # true if current_user is asking for his own friends
  # true if current_user is a friend of the user for whom to get the friends
  def friends?
    return true if user == current_user
    return true if user.friend_with? current_user
    false
  end

  # no prerequisites
  def media_items?
    true
  end

  # true if a user with this email exists
  # however, if this wouldn't be the case the API
  # would already have returned a 404
  def reset_password?
    true
  end
end
