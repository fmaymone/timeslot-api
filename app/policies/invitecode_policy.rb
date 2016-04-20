class InvitecodePolicy < ApplicationPolicy
  # true if the user is signed in
  def create?
    current_user?
  end

  # no prerequisites
  def show?
    true
  end
end