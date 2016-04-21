class ImportPolicy < ApplicationPolicy

  # true if current user is logged in
  def handler?
    current_user?
  end
end
