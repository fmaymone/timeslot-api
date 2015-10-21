class StdSlotPolicy < SlotPolicy
  # true if the user is signed in
  def create_stdslot?
    current_user?
  end

  def create_webslot?
    current_user?
  end

  # for demo purpose
  def show_last?
    true
  end

  # true if the user is signed in and
  # the user is slot owner
  # meta data? can they only be updated by the creator?
  def update_stdslot?
    current_user?
    # return false unless current_user?
    # return true if slot.try(:owner) == current_user
    # false
  end

  # true if the user is signed in and
  # the user is slot owner
  def destroy_stdslot?
    # TODO:
    # current_user? && (slot.owner == current_user.id)
    current_user?
  end
end
