class SlotPolicy < ApplicationPolicy
  attr_reader :current_user, :slot

  def initialize(user, slot)
    @current_user = user
    @slot = slot
  end

  # true if slot is public
  # true if the current user is allowed to see this slot
  def show?
    return true if slot.StdSlotPublic?
    return true if slot.ReSlotPublic?
    return true if slot.GroupSlotPublic?
    show_to_current_user?
  end

  def show_many?
    show?
  end

  # true if the user is signed in and
  # the slot which gets resloted is a public slot or
  # the slot is a friendslot from a friend of the current user or
  # the slot is in a public group
  # in other words: allowed if the user is allowed to see the slot
  # which he wants to reslot
  def create_reslot?
    return false if slot.StdSlotPrivate?
    # TODO: remove next line when we have ReSlot visibilities
    return true if slot.ReSlot?
    show_to_current_user?
  end

  def share_url?
    show?
  end

  # this should only be allowed for our rails slot webview app
  def share_data?
    return false unless current_user?
    return true if current_user.webview?
    false
  end

  def add_like?
    show_to_current_user?
  end

  # true if current user has liked the slot before
  def unlike?
    return false unless current_user?
    return true if slot.likes.exists?(user: current_user)
    false
  end

  def show_likes?
    show?
  end

  # false if slot is private? (screen doesn't have 'Add a comment')
  def add_comment?
    return false if slot.StdSlotPrivate?
    show_to_current_user?
  end

  def show_comments?
    return false if slot.StdSlotPrivate?
    show?
  end

  # ASK: can only logged in users see the history?
  def reslot_history?
    return false if slot.StdSlotPrivate?
    show_to_current_user?
  end

  def copy?
    show_to_current_user?
  end

  # TODO: need more domain info: target
  # true if I'm the slot owner, visibilty can only increase
  # true if I'm the slotter of a reslot, target only private, friends or group
  # false if groupslot
  # ASK why should I move a slot into reslots? Ich glaube, move to reslots macht niemals sinn
  def move?
    return false unless current_user?
    return true if current_user == slot.try(:owner)
    return true if current_user == slot.try(:slotter)
    false
  end

  def show_slotters?
    show_to_current_user?
  end

  # helper

  # checks if current_user has read access
  private def show_to_current_user?
    # current user must exist
    return false unless current_user?
    return show_std_slot? if slot.class < StdSlot
    return show_re_slot? if slot.try(:slotter)
    # if slot.class < ReSlot or slot.class == ReSlot
    return show_group_slot? if slot.try(:group)
    false
  end

  # standard slot
  # true if it's a public slot
  # true if it's my slot
  # true if it's friendslot and current_user is befriended with slot owner
  # true if it's foafslot & current_user has common friends with slot owner
  # FYI: foaf = friend-of-a-friend, so it's friends-of-friends visibility
  private def show_std_slot?
    return true if slot.StdSlotPublic?
    return true if current_user == slot.owner
    if slot.StdSlotFriends? || slot.StdSlotFoaf?
      return true if current_user.friend_with?(slot.owner)
    end
    # combined check determines if read access to foaf slot
    return false unless slot.StdSlotFoaf?
    return true if current_user.common_friend_with?(slot.owner)
    false
  end

  # re slot
  # true if it's a reslot of mine
  # true if it's a reslot from a friend
  # true if it's a reslot from a public slot
  # later: true if it's a reslot from a pulic group's groupslot
  private def show_re_slot?
    return true if slot.ReSlotPublic?
    return true if current_user == slot.slotter
    return true if current_user.friend_with?(slot.slotter)
    # TODO: remove following lines later, they should not be necessary then
    parent = BaseSlot.get(slot.parent.id)
    return true if parent.StdSlotPublic?
    # return true if parent.GroupSlotPublic?
    false
  end

  # group slot
  # true if slot is group slot and I'm a member of the group
  # later: true if it's a groupslot in a pulic group
  private def show_group_slot?
    return true if slot.GroupSlotPublic?
    return true if slot.group.members.include? current_user
  end
end
