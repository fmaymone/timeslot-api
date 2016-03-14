class SlotsetManager
  # adds or removes a single slot from a slotset aka calendar
  include TSErrors

  def initialize(current_user:)
    @current_user = current_user
  end

  def add!(slot, slotset)
    # for 'normal' slot groups
    if slotset.class == Group
      fail TSErrors::SlotGroupDeleted if slotset.deleted_at?

      result = Containership.find_or_create_by(slot: slot, group: slotset)
      result.update(deleted_at: nil) if result.deleted_at?
      slot.follow(slotset)
      result.create_activity

      put_into_schedule_of_members(slot, slotset)

    # for the current users 'schedule'
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
      # next if slotset.deleted_at? # would be more graceful

      result = slot.containerships.find_by(group: slotset)
      if result
        result.delete unless result.deleted_at?
        # result.create_activity
      end

      hide_from_schedule_of_members(slot, slotset)

    elsif current_user.slot_sets['my_cal_uuid'] == slotset
      result = current_user.passengerships.find_by(slot: slot)
      result.update(show_in_my_schedule: false) if result
    end
  end

  private

  attr_reader :current_user

  # creates a passengership for all group members which have
  # 'show in my schedule' enabled for this group
  private def put_into_schedule_of_members(slot, slotset)
    slotset.active_memberships.find_each do |membership|
      next unless membership.show_slots_in_schedule?

      member = membership.user
      result = Passengership.find_or_create_by(slot: slot, user: member)
      result.update(deleted_at: nil) if result.deleted_at?
      result.update(show_in_my_schedule: true) unless result.show_in_my_schedule?
      member.follow(slot) # is already following group, is it needed?
      # result.create_activity # is it needed?
    end
  end

  # hides the slot for all group members which have
  # 'show in my schedule' enabled for this group/calendar
  private def hide_from_schedule_of_members(slot, slotset)
    slotset.active_memberships.find_each do |membership|
      # skip members which have 'show in my schedule' disabled
      next unless membership.show_slots_in_schedule?

      member = membership.user
      # don't hide slot from schedule if member has other calenders with
      # the same slot where 'show in my schedule' is 'true'
      next if member.calendars_in_schedule.find(slot.slot_group_ids).any?

      result = Passengership.find_by(slot: slot, user: member)
      result.update(show_in_my_schedule: false) if result.show_in_my_schedule?
      member.unfollow(slot) # is already following group, is it needed?
    end
  end
end
