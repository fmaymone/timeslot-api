class SearchPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  # true if a user is logged in
  def user?
    current_user?
  end

  # true if a user is logged in
  def friend?
    current_user?
  end

  # true if a user is logged in
  def email?
    current_user?
  end

  # true if a user is logged in
  def slot?
    current_user?
  end

  # true if a user is logged in
  def media?
    current_user?
  end

  # true if a user is logged in
  def group?
    current_user?
  end

  # true if a user is logged in
  def location?
    current_user?
  end

  # true if a user is logged in
  def categories?
    current_user?
  end
end
