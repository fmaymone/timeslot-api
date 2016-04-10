class ImportPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  # true if import-admin-user is logged in
  # NOTE: the import-admin-user is able to create Slots, Calendars and
  # Users during one import, this feature requires a special security
  # TODO: move to env
  def handler?
    current_user? &&
    @current_user.email == 'import@timeslot.com'
  end
end
