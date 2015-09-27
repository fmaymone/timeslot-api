class ActivityPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  # true if a user is logged in
  def user_feed?
    current_user?
  end

  # true if a user is logged in
  def news_feed?
    current_user?
  end

  # true if a user is logged in
  def notification_feed?
    current_user?
  end
end
