class SlotPolicy < ApplicationPolicy
  def index?
    current_user?
  end

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
    return true if record.try(:visibility) == '11'
    return false unless current_user?
    # return true if slot.friendslot? && user.friend_with? slot.owner
    return true if user == record.try(:owner)
    return true if record.try(:group).try(:members).try(:include?, user)
    false
  end

  # same as show?, need to check for every requested slot I think
  def show_many?
    true
  end

  def update_metaslot?
    current_user?
  end

  # same as show?
  def add_comment?
    new_show?
  end

  # same as show?
  def show_comments?
    new_show?
  end
end
