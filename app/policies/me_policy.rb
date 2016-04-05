class MePolicy < ApplicationPolicy
  # all methodes for ME require that a user is logged in

  def show?
    current_user?
  end

  def update?
    current_user?
  end

  def inactivate?
    current_user?
  end

  def signout?
    current_user?
  end

  def my_slots?
    current_user?
  end

  def calendar?
    current_user?
  end

  def my_friends?
    current_user?
  end

  def slots_of_my_friends?
    current_user?
  end

  def my_media_items?
    current_user?
  end

  def suggested_users?
    current_user?
  end

  def calendars?
    current_user?
  end

  def update_device?
    current_user?
  end

  def add_friends?
    current_user?
  end

  def remove_friends?
    current_user?
  end

  # we could handle something like: don't allow befriending/unfriending
  # with users with a public profile, when we have them (one can instead
  # follow those Users)
  def befriend?
    current_user?
  end

  # should be idempotent, so can be called if the User exists, which
  # should be true if we got till here
  def unfriend?
    current_user?
  end
end
