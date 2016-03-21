class CalendarCollector
  def initialize(current_user)
    @current_user = current_user
  end

  def calendars_for(user)
    public_calendars = user.active_groups.public
    my_calendar_ids = @current_user.active_group_ids
    shared_calendars = user.active_groups.non_public.where(id: my_calendar_ids)

    public_calendars + shared_calendars
  end

  private

  attr_reader :current_user
end
