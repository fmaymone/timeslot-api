class SlotPolicy < ApplicationPolicy
  attr_reader :current_user, :slot

  def initialize(user, slot)
    @current_user = user
    @slot = slot
  end

  # read methods allowed for users and visitors

  # true if slot is public
  # true if the current user is allowed to see this slot
  def show?
    return true if slot.visibility == 'public'
    current_user_has_read_access?
  end

  # true if the user is signed in
  def create?
    current_user?
  end

  def show_likes?
    show?
  end

  # true if user has read access for the slot, excluding private StdSlots would
  # mean, that I can't see comments an a public slot I made private...
  def show_comments?
    show?
  end

  # methods that require a signed-in user

  # true if user is signed-in and has read-access for the slot
  def add_like?
    current_user_has_read_access?
  end

  # true if user is signed-in and has read-access for the slot
  def unlike?
    current_user_has_read_access?
  end

  # true if user is signed-in and has read-access for the slot
  def add_comment?
    current_user_has_read_access?
  end

  def show_slotters?
    current_user_has_read_access?
  end

  # only the slot creator is allowes to tag users to the slot
  def tag_users?
    return false unless current_user?
    return true if slot.creator == current_user
    false
  end

  # true if user is signed-in and has read-access for the slot
  def show_tagged_users?
    current_user_has_read_access?
  end

  # true if user is signed-in and has read-access for the slot
  def slotsets?
    current_user_has_read_access?
  end

  # actions

  # FIX: remove when globalslot-reslot is updated
  def create_reslot?
    return false if slot.StdSlotPrivate?
    current_user_has_read_access?
  end

  # TODO: non-public reslots can be added to private slot_groups, but not to
  # shared or public slot_groups, but this is not checked atm
  # false if no user is signed-in
  # true if slot is public visible
  # true if it's my own slot
  # group permissions are checked per slotgroup
  def add_to_groups?
    current_user_has_read_access?
    # return false unless current_user?
    # return true if slot.visibility == 'public'
    # return true if slot.class < StdSlot && slot.creator == current_user
    # false
  end

  # false if no user is signed-in
  # true, if the user has read access for the slot
  # group permissions are checked per slotgroup
  def remove_from_groups?
    current_user_has_read_access?
  end

  # helper

  # true if it's a public slot
  # true if it's my slot
  # TODO: true if slot is in a slotgroup where I'm a member of
  # true if it's friendslot and current_user is befriended with slot owner
  # true if it's foafslot & current_user has common friends with slot owner
  # FYI: foaf = friend-of-a-friend, so it's friends-of-friends visibility
  private def current_user_has_read_access?
    # current user must exist
    return false unless current_user?
    return true if slot.visibility == 'public'
    # return true if slot.class == GlobalSlot # is public
    return true if current_user == slot.creator
    return true if slot.tagged_users.include? current_user
    return true if (slot.slot_groups & current_user.groups).any?
    if slot.StdSlotFriends? || slot.StdSlotFoaf?
      return true if current_user.friend_with?(slot.creator)
    end
    # combined check determines if read access to foaf slot
    return false unless slot.StdSlotFoaf?
    return true if current_user.common_friend_with?(slot.creator)
    false
  end
end
