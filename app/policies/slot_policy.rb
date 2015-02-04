class SlotPolicy < ApplicationPolicy
  def index?
    current_user?
  end

  # true if slot is public
  # true if slot is friend slot and i am a friend of the owner
  # true if it is my slot
  def show?
    true
  end

  def show_many?
    true
  end

  def update_metaslot?
    current_user?
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
    return true if record.likes.exists?(user: user)
    false
  end

  # true if slot is public std slot
  # true if it is my slot
  # true if slot is friend slot and i am a friend of the owner
  # true if slot is group slot and i am member of the group
  # reslots?
  def get_likes?
    return true if record.try(:visibility) == '11'
    return false unless current_user?
    # return true if slot.friendslot? && user.friend_with? slot.owner
    return true if user == record.try(:owner)
    return true if record.try(:group).try(:members).try(:include?, user)
    false
  end
end
