class ReSlotPolicy < SlotPolicy
  # true if the user is signed in and
  # the user is the slotter
  # is there only one set of media items/notes (those on the parent) for
  # all reslots?
  # TODO: reslot metadata can probably not be updated, add check
  def update_reslot?
    current_user?
  end

  # true if the user is signed in and
  # the user is the slotter
  def delete?
    return false unless current_user?
    return true if current_user == slot.slotter
    false
  end
end
