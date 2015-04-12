class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  # true if a user is logged in
  def index?
    current_user?
  end

  # true if a user is logged in
  def show?
    current_user?
  end

  # no prerequisites
  def create?
    true
  end

  # true if a user with this email exists
  # however, if this wouldn't be the case the API
  # would already have returned a 404
  def signin?
    true
  end

  # true if a user is logged in
  def signout?
    current_user?
  end

  # true if a user with this email exists
  # however, if this wouldn't be the case the API
  # would already have returned a 404
  def reset_password?
    true
  end

  # true if a user is logged in
  def update?
    current_user?
  end

  # false if no current user
  # true if request is for the own slots of the signed-in user
  def slots?
    return false unless current_user?
    return true if user == current_user
    false
  end

  # true if a user is logged in
  def add_friends?
    current_user?
  end

  # true if a user is logged in
  def remove_friends?
    current_user?
  end

  # true if a user is logged in
  def destroy?
    current_user?
  end

  class Scope < Scope
    # def resolve
    #   user.my_slots
    # end

    # scope is a query object of the slots of the user for which the request was made
    # e.q. /v1/users/2/slots would have scope User.find(2).slots which would
    # include all public, friend and private slots for this user
    # then in the resolve I
    def resolve
      p 'user resolver'

      # if user == current_user
      if user == scope
        scope.my_slots
        # all
      elsif user.friend_with? current_user
      # public slots and friendslots
      else
        # public slots
        scope.where(user_id: @user.id)
        scope.where(:published => true)
      end
    end
  end
end
