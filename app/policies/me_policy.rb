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

  def slots_from_friends?
    current_user?
  end

  def media_items?
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
end
