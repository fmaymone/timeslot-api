class UserPolicy < ApplicationPolicy
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
