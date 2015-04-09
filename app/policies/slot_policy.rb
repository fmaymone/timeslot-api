class SlotPolicy < ApplicationPolicy
  attr_reader :current_user, :slot

  class Scope < Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      user.my_slots
    end
  end

  def initialize(user, slot)
    @current_user = user
    @slot = slot
  end

  # false if no current user
  def index?
    current_user?
  end

  # true if slot is public
  # true if the current user is allowed to see this slot
  def show?
    return true if slot.try(:public?) # allow for visitors
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
    return false if slot.try(:private?)
    show_to_current_user?
  end

  def show_comments?
    return false if slot.try(:private?)
    show?
  end

  # ASK: can only logged in users see the history?
  def reslot_history?
    return false if slot.try(:private?)
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

  # helper

  def show_to_current_user?
    # current user must exist
    return false unless current_user?

    # standard slot
    # true if it's a public slot
    # true if it is my slot
    # true if slot is friendslot and from a friend aka I'm a friend of the slot owner
    if slot.try(:visibility)
      return true if slot.public?
      return true if current_user == slot.owner
      return true if slot.friendslot? && current_user.friend_with?(slot.owner)
    end

    # re slot
    # true if it's a reslot of mine
    # true if it's a reslot from a friend
    # true if it's a reslot from a public slot
    # later: true if it's a reslot from a pulic group's groupslot
    if slot.try(:slotter)
      return true if current_user == slot.slotter
      return true if current_user.friend_with?(slot.slotter)
      parent = BaseSlot.get(slot.parent.id)
      return true if parent.try(:public?)
      # return true if parent.try(:group).try(:public?)
    end

    # group slot
    # true if slot is group slot and i am member of the group
    # later: true if it's a groupslot in a pulic group
    if slot.try(:group)
      return true if slot.group.members.include? current_user
    end

    false
  end
end
