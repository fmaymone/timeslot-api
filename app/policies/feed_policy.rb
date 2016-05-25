class FeedPolicy < ApplicationPolicy

  # true for all users
  def discovery_feed?
    true
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
