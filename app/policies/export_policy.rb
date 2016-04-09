class ExportPolicy < ApplicationPolicy

  # true if a user is logged in
  def ical?
    current_user?
  end

  # true if a user is logged in
  def google?
    current_user?
  end

  # true if a user is logged in
  def timeslot?
    current_user?
  end

  # true if a user is logged in
  def outlook?
    current_user?
  end
end
