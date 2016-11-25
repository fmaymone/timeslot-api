class StdSlotPolicy < SlotPolicy
  # TODO: write spec
  def slotsets?
    current_user_has_read_access?
  end

  # true if the user is signed in and
  # the user is slot owner
  # meta data? can they only be updated by the creator?
  def update?
    return false unless current_user?
    return true if current_user == slot.owner
    false
  end

  # true if the user is signed in and
  # the user is slot owner
  def delete?
    return false unless current_user?
    return true if current_user == slot.owner
    false
  end

  # true if the user is signed in and
  # the user is slot owner
  def delete_media?
    return false unless current_user?
    return true if current_user == slot.owner
    false
  end

  # true if the user is signed in and
  # the user is slot owner
  def delete_notes?
    return false unless current_user?
    return true if current_user == slot.owner
    false
  end
end
