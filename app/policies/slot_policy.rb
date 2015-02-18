class SlotPolicy < ApplicationPolicy
  attr_reader :user, :slot

  def initialize(user, slot)
    @user = user
    @slot = slot
  end

  def index?
    current_user?
  end

  # true if slot is public
  # true if slot is friend slot and i am a friend of the owner
  # true if it is my slot
  # TODO: replace by new_show?
  def show?
    true
  end

  # true if slot is public std slot
  # current user must exist and must be allowed to see slot:
  # true if it is my slot
  # true if slot is friend slot and i am a friend of the owner
  # true if slot is group slot and i am member of the group
  def new_show?
    return true if slot.try(:visibility) == '11'
    return false unless current_user?
    # return true if slot.friendslot? && user.friend_with? slot.owner
    return true if user == slot.try(:owner)
    return true if slot.try(:group).try(:members).try(:include?, user)
    false
  end

  # same as show?, need to check for every requested slot I think
  def show_many?
    true
  end

  def update_metaslot?
    current_user?
  end

  # TODO
  def share_url?
    show?
  end

  # TODO
  # this should only be allowed for our other rails app
  def share_data?
    show?
  end

  # current user must exist
  # current user must be allowed to see slot:
  # true if slot is public
  # true if slot is friend slot and i am a friend of the owner
  # true if it is my slot
  def add_like?
    current_user?
    # TODO: add scope check
  end

  # true if like was made by current user
  def unlike?
    return false unless current_user?
    return true if slot.likes.exists?(user: user)
    false
  end

  # true if slot is public std slot
  # true if it is my slot
  # true if slot is friend slot and i am a friend of the owner
  # true if slot is group slot and i am member of the group
  # reslots?
  def get_likes?
    return true if slot.try(:visibility) == '11'
    return false unless current_user?
    # return true if slot.friendslot? && user.friend_with? slot.owner
    return true if user == slot.try(:owner)
    return true if slot.try(:group).try(:members).try(:include?, user)
    false
  end

  # same as show?
  # false if slot is private? (screen doesn't have 'Add a comment')
  def add_comment?
    new_show?
  end

  # same as show?
  def show_comments?
    new_show?
  end

  # true if I have resloted this slot
  def reslot_history?
    return false unless current_user?
    return true if user == slot.try(:slotter)
    false
  end

  # same as show? ???
  def copy?
    new_show?
  end

  # same as show? ???
  def move?
    new_show?
  end
end
