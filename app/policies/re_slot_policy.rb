class ReSlotPolicy < SlotPolicy
  def create_reslot?
    current_user?
  end

  def update_reslot?
    current_user?
  end

  def destroy_reslot?
    current_user?
  end
end
