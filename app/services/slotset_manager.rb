class SlotsetManager
  include TSErrors

  def initialize(current_user:)
    @current_user = current_user
  end

  def add!(slot, slotset)
    if slotset.class == Group
      fail TSErrors::SlotGroupDeleted if slotset.deleted_at?

      result = Containership.find_or_create_by(slot: slot, group: slotset)
      result.update(deleted_at: nil) if result.deleted_at?
      slot.follow(slotset)
      result.create_activity
    elsif current_user.slot_sets['my_cal_uuid'] == slotset
      # current_user.my_calendar_slots << slot
      result = Passengership.find_or_create_by(slot: slot, user: current_user)
      result.update(deleted_at: nil) if result.deleted_at?
      current_user.follow(slot)
      result.create_activity

      # case slot_set
      # when 'my_cal_uuid'
      #   Passengership.find_or_create_by(slot: slot,
      #                                   user: current_user).update(deleted_at: nil)
      # when 'my_friends_slots_uuid'
      #   slot.StdSlotFriends!
      # when 'my_public_slots_uuid'
      #   pp 'create public slot'
      # end
    end
  end

  def remove!(slot, slotset)
    if slotset.class == Group
      fail TSErrors::SlotGroupDeleted if slotset.deleted_at?

      result = slot.containerships.find_by(group: slotset)
      if result
        result.delete unless result.deleted_at?
        # result.create_activity
      end
    elsif current_user.slot_sets['my_cal_uuid'] == slotset
      result = current_user.passengerships.find_by(slot: slot)
      result.delete if result && !result.deleted_at?
    end
  end

  private

  attr_reader :current_user
end
