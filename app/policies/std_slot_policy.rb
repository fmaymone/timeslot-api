class StdSlotPolicy < SlotPolicy
  def create_stdslot?
    current_user?
  end

  def update_stdslot?
    current_user?
  end

  def destroy_stdslot?
    current_user?
  end
end
