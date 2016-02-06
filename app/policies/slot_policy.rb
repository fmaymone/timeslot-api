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

  # will probably be removed
  def show_many?
    show?
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

  # true if current user has liked the slot before
  def unlike?
    return false unless current_user?
    return true if slot.likes.exists?(user: current_user)
    false
  end

  # false if slot is private? (screen doesn't have 'Add a comment')
  # we need this for private slots so comments can be made in slotgroups
  def add_comment?
    current_user_has_read_access?
  end

  def show_slotters?
    current_user_has_read_access?
  end

  # TODO: write spec
  def update_user_tags?
    current_user_has_read_access?
  end

  # TODO: write spec
  def get_user_tags?
    # current_user_has_read_access?
    # we had a problem that people which were tagged to a private slot couldn't
    # get the tags because they had no read access for the slot, to temporary
    # work around this (until we have a proper specification for user tagging)
    # I relax this policy
    current_user?
  end

  # false if no user is signed-in
  # true, if the user has read access for the slot
  # group permissions are checked per slotgroup
  def remove_from_groups?
    current_user_has_read_access?
  end

  # will probably be removed
  def reslot_history?
    current_user_has_read_access?
  end

  # will probably be removed
  def copy?
    current_user_has_read_access?
  end

  # will probably be removed
  def move?
    return false unless current_user?
    return true if current_user == slot.try(:owner)
    return true if current_user == slot.try(:slotter)
    false
  end

  # actions

  # true if the user is signed in and
  # the slot which gets resloted is a public slot or
  # the slot is a friendslot from a friend of the current user or
  # the slot is in a public group
  # in other words: allowed if the user is allowed to see the slot
  # which he wants to reslot
  def create_reslot?
    return false if slot.StdSlotPrivate?
    current_user_has_read_access?
  end

  # TODO: non-public reslots can be added to private slot_groups, but not to
  # shared or public slot_groups, but this is not checked atm
  # false if no user is signed-in
  # true if slot is public visible
  # true if it's my own slot
  # true if it's a reslot I made
  # group permissions are checked per slotgroup
  def add_to_groups?
    return false unless current_user?
    return true if slot.visibility == 'public'
    return true if slot.class < StdSlot && slot.owner == current_user
    return true if slot.class < ReSlot && slot.slotter == current_user
    false
  end

  # helper

  private def current_user_has_read_access?
    # current user must exist
    return false unless current_user?
    return true if slot.visibility == 'public'
    # return true if slot.class == GlobalSlot # is public
    return show_std_slot? if slot.class < StdSlot
    return show_re_slot? if slot.class <= ReSlot
    false
  end

  # standard slot
  # true if it's a public slot
  # true if it's my slot
  # TODO: true if slot is in a slotgroup where I'm a member of
  # true if it's friendslot and current_user is befriended with slot owner
  # true if it's foafslot & current_user has common friends with slot owner
  # FYI: foaf = friend-of-a-friend, so it's friends-of-friends visibility
  private def show_std_slot?
    # return true if slot.StdSlotPublic? # already checked
    return true if current_user == slot.owner
    return true if (slot.slot_groups & current_user.groups).any?
    if slot.StdSlotFriends? || slot.StdSlotFoaf?
      return true if current_user.friend_with?(slot.owner)
    end
    # combined check determines if read access to foaf slot
    return false unless slot.StdSlotFoaf?
    return true if current_user.common_friend_with?(slot.owner)
    false
  end

  # re slot
  # true if it's a public reslot (a reslot from a public slot)
  # true if it's my own reslot
  # true if it's a friend-visible reslot of a friend
  # true if it's a foaf-visible reslot of a user with common friends
  # later: true if it's a reslot from a pulic group's groupslot
  private def show_re_slot?
    # return true if slot.ReSlotPublic? # already checked
    return true if current_user == slot.slotter
    # TODO: return true if slot is in a slotgroup where user has access
    if slot.ReSlotFriends? || slot.ReSlotFoaf?
      return true if current_user.friend_with?(slot.slotter)
    end
    # combined check determines if read access to foaf slot
    return false unless slot.ReSlotFoaf?
    return true if current_user.common_friend_with?(slot.slotter)
    false
  end

  # group slot
  # true if slot is group slot and I'm a member of the group
  # later: true if it's a groupslot in a public group
  # private def show_group_slot?
  #   return true if slot.GroupSlotPublic?
  #   return true if slot.group.members.include? current_user
  # end
end
