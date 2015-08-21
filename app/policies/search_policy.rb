class SearchPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  # always true
  def index?
    true
  end

  # true if a user is logged in
  def users?
    current_user?
  end

  # true if a user is logged in
  def slots?
    current_user?
  end

  # true if a user is logged in
  def media?
    current_user?
  end
end
