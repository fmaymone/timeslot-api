class CalendarInScheduleManager
  # sets the 'show_slots_in_schedule'-value accordingly
  # creates or updates a passengership for every slot in the slotset, sets the
  # 'show_in_my_schedule'-value of the slots
  def initialize(current_user)
    @user = current_user
  end

  def show(calendar)
    membership = user.active_memberships.find_by group: calendar
    membership.update(show_slots_in_schedule: true)

    calendar.slots.each do |slot|
      # which one is better ?
      ps = user.passengerships.find_or_create_by(slot: slot)
      # ps = user.passengerships.where(slot: slot).first_or_create
      ps.update(show_in_my_schedule: true)
    end
  end

  def hide(calendar)
    membership = user.active_memberships.find_by group: calendar
    membership.update(show_slots_in_schedule: false)
    enabled_calendars = user.calendars_in_schedule_ids

    calendar.slot_ids.each do |slot_id|
      # are there other calenders in MySchedule which contain the slot?
      calendars_with_slot = Containership.where(slot_id: slot_id).pluck(:group_id)
      shown_calendars_with_slot = enabled_calendars & calendars_with_slot

      next if shown_calendars_with_slot.any?

      ps = user.passengerships.find_by(slot_id: slot_id)
      ps.update(show_in_my_schedule: false)
    end
  end

  private

  attr_reader :user
end
