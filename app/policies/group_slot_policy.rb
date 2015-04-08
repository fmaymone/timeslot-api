class GroupSlotPolicy < SlotPolicy
  attr_reader :current_user, :slot, :group

  def initialize(user, groupslot)
    @current_user = user
    @slot = groupslot
    @group = groupslot.group
  end

  # false if no current user
  # true if user is group owner and member (should he be able to post when he left the group?)
  # true if user is a group member and members can post
  def create_groupslot?
    return false unless current_user?
    return false unless current_user.active_member? group
    return true if current_user.owner? group
    return true if group.members_can_post
    false
  end

  # same as create_groupslot
  def update_groupslot?
    create_groupslot?
  end

  # same as create_groupslot
  def destroy_groupslot?
    create_groupslot?
  end
end
