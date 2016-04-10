class ExportPolicy < ApplicationPolicy
  attr_reader :current_user, :slot

  def initialize(user, slot)
    @current_user = user
    @slot = slot
  end

  # true if the current user is the creator this slot
  def ical?
    user_is_creator?
  end

  # true if the current user is the creator this slot
  def google?
    user_is_creator?
  end

  # true if the current user is the creator this slot
  def timeslot?
    user_is_creator?
  end

  # true if the current user is the creator this slot
  def outlook?
    user_is_creator?
  end

  private def user_is_creator?
    current_user == slot.creator
  end
end
