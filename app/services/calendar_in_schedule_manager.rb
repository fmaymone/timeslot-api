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

  private

  attr_reader :user
end
