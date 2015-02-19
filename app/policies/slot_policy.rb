class SlotPolicy < ApplicationPolicy
  attr_reader :user, :slot

  def initialize(user, slot)
    @user = user
    @slot = slot
  end

  # false if no current user
  # TODO: use Pundit scope here?
  def index?
    current_user?
  end

  # true if slot is public
  # true if the current user is allowed to see this slot
  def show?
    return true if slot.try(:public?) # allow for visitors
    show_to_current_user?
  end

  # same as show?, need to check for every requested slot I think
  # TODO: also I may need to use pundit scopes here
  def show_many?
    true
  end

  # probably only the creator is allowed to do this
  # TODO: need to put this into its own policy, make sure its worth the effort
  def update_metaslot?
    # return false unless current_user?
    # return true if user == slot.creator
    # false
    current_user?
  end

  def share_url?
    show?
  end

  # this should only be allowed for our rails slot webview app
  def share_data?
    return false unless current_user?
    return true if user.webview?
    false
  end

  def add_like?
    show_to_current_user?
  end

  # true if current user has liked the slot before
  def unlike?
    return false unless current_user?
    return true if slot.likes.exists?(user: user)
    false
  end

  def get_likes?
    show?
  end

  # false if slot is private? (screen doesn't have 'Add a comment')
  def add_comment?
    return false if slot.try(:private?)
    show_to_current_user?
  end

  def show_comments?
    show?
  end

  # can only logged in users see the history?
  def reslot_history?
    show_to_current_user?
  end

  def copy?
    show_to_current_user?
  end

  # TODO
  def move?
    show_to_current_user?
  end

  # helper

  def show_to_current_user?
    # current user must exist
    return false unless current_user?

    # standard slot
    # true if it is my slot
    # true if slot is friendslot and from a friend aka I'm a friend of the slot owner
    if slot.try(:visibility)
      return true if slot.public?
      return true if user == slot.owner
      return true if slot.friendslot? && user.friend_with?(slot.owner)
    end

    # re slot
    # true if it's a reslot from a friends
    # true if it's a public reslot
    if slot.try(:slotter)
      return true if user == slot.slotter
      return true if user.friend_with?(slot.slotter)
      return true if slot.parent.public?
    end

    # group slot
    # true if slot is group slot and i am member of the group
    if slot.try(:group)
      return true if slot.group.members.include? user
    end

    false
  end
end
