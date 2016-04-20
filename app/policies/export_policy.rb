class ExportPolicy < ApplicationPolicy
  attr_reader :current_user

  def initialize(user, record)
    @current_user = user
  end

  # true if the current user is logged in
  def ical?
    current_user?
  end

  # true if the current user is logged in
  def google?
    current_user?
  end

  # true if the current user is logged in
  def timeslot?
    current_user?
  end

  # true if the current user is logged in
  def outlook?
    current_user?
  end
end
