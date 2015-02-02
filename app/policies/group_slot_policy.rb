class GroupSlotPolicy < SlotPolicy
  def create_groupslot?
    return false unless current_user?
    return true if user.is_owner? record.group.id
    return true if record.group.members_can_post
    false
  end

  def update_groupslot?
    return false unless current_user?
    return true if user.is_owner? record.group_id
    return true if record.group.members_can_post
    false
  end

  def destroy_groupslot?
    return false unless current_user?
    return true if user.is_owner? record.group_id
    return true if record.group.members_can_post
    false
  end
end
