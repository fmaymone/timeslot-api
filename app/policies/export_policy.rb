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
  def backup?
    current_user?
  end
end
