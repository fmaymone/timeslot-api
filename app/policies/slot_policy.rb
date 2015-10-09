class SlotPolicy < ApplicationPolicy
  attr_reader :current_user, :slot

  # TODO: add spec for scoped policy BKD-126
  class Scope < Scope
    attr_reader :current_user

    def initialize(user, _scope)
      @current_user = user.current_user
    end

    # TODO: optimize db access / query BKD-121
    def friend_slots
      slots = []
      current_user.friends.each do |friend|
        slots.push(*friend.std_slots_friends.upcoming)
        slots.push(*friend.std_slots_public.upcoming)
        slots.push(*friend.re_slots.upcoming)
      end
      slots.sort { |x, y| x.start_date <=> y.start_date }
    end
  end

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

  def show_to_current_user?
    # current user must exist
    return false unless current_user?

    # standard slot
    # true if it's a public slot
    # true if it is my slot
    # true if slot is friendslot and from a friend aka I'm a friend of the slot owner
    # if slot.try(:visibility)
    if slot.class < StdSlot
      return true if slot.StdSlotPublic?
      return true if current_user == slot.owner
      return true if slot.StdSlotFriends? && current_user.friend_with?(slot.owner)
    end

    # re slot
    # true if it's a reslot of mine
    # true if it's a reslot from a friend
    # true if it's a reslot from a public slot
    # later: true if it's a reslot from a pulic group's groupslot
    if slot.try(:slotter)
    # if slot.class < ReSlot or slot.class == ReSlot
      return true if slot.ReSlotPublic?
      return true if current_user == slot.slotter
      return true if current_user.friend_with?(slot.slotter)
      # TODO: remove following lines later, they should not be necessary then
      parent = BaseSlot.get(slot.parent.id)
      return true if parent.StdSlotPublic?
      # return true if parent.GroupSlotPublic?
    end

    # group slot
    # true if slot is group slot and i am member of the group
    # later: true if it's a groupslot in a pulic group
    if slot.try(:group)
      return true if slot.GroupSlotPublic?
      return true if slot.group.members.include? current_user
    end

    false
  end
end
