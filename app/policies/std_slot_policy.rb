class StdSlotPolicy < SlotPolicy
  # true if the user is signed in
  def create_stdslot?
    current_user?
  end

  def create_webslot?
    current_user?
  end

  # true if the user is signed in and
  # the user is slot owner
  # meta data? can they only be updated by the creator?
  def update_stdslot?
    return false unless current_user?
    return true if current_user == slot.owner
    false
  end

  # true if the user is signed in and
  # the user is slot owner
  def destroy_stdslot?
    return false unless current_user?
    return true if current_user == slot.owner
    false
  end
end
