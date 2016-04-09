class ImportPolicy < ApplicationPolicy

  # true if a user is logged in
  def handler?
    current_user?
  end
end
