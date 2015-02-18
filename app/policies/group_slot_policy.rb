class GroupSlotPolicy < SlotPolicy
  attr_reader :user, :groupslot

  def initialize(user, groupslot)
    @user = user
    @groupslot = groupslot
  end

  def create_groupslot?
    return false unless current_user?
    return true if user.is_owner? groupslot.group.id
    return true if groupslot.group.members_can_post
    false
  end

  def update_groupslot?
    return false unless current_user?
    return true if user.is_owner? groupslot.group_id
    return true if groupslot.group.members_can_post
    false
  end

  def destroy_groupslot?
    return false unless current_user?
    return true if user.is_owner? groupslot.group_id
    return true if groupslot.group.members_can_post
    false
  end
end
