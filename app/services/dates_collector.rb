class DatesCollector

  def initialize(current_user: nil, timezone: nil)
    @current_user = current_user
    @timezone = timezone || Time.zone.now.utc.formatted_offset
  end

  def group_slot_dates(group:)
    collection = group.slots
    date_series_for_slots(slot_collection: collection)
  end

  # returns the dates for the slots which are returned by /v1/users/:id/slots
  def user_slot_dates(user:)
    relationship = UserRelationship.call(@current_user.try(:id), user.id)
    collections = PresentableSlots.call(relationship: relationship,
                                        user: user,
                                        current_user: @current_user)
    collect_dates(collections)
  end

  def collect_dates(collections)
    dates = []
    collections.each do |collection|
      dates |= date_series_for_slots(slot_collection: collection)
    end
    dates
  end

  # takes the timezone of the client into account
  def date_series_for_slots(slot_collection:)
    query = slot_collection.joins(:meta_slot).select(
      "(generate_series(
         DATE_TRUNC('Day',
                    start_date::TIMESTAMPTZ AT TIME ZONE '#{@timezone}'::INTERVAL
         )::DATE,
         DATE_TRUNC('Day',
                    end_date::TIMESTAMPTZ AT TIME ZONE '#{@timezone}'::INTERVAL
         )::DATE, '1 day'))::DATE AS slotdate"
    ).distinct
    # executing query 'by hand' so rails does not load the objects
    ActiveRecord::Base.connection.execute(query.to_sql).field_values('slotdate')
  end

  ###################
  # TODO: cleanup, only for reference, wip

  # collects all dates where a slot is
  def days_with_slots(group:)
    # ARRAY_AGG(name) AS reminder_names,

    # days_with_reminders = group.slots_with_associations.find_by_sql("

    #   days_with_reminders = MetaSlot.select("
  #   ARRAY_AGG(title) AS reminder_names,
  #   DATE_TRUNC(
  #     'Day',
  #     start_date::TIMESTAMPTZ AT TIME ZONE '#{timezone}'::INTERVAL
  #   ) AS reminder_day
  # ").group('reminder_day')

    # days_with_reminders = MetaSlot.select("
    #   DATE_TRUNC('Day',
    #              start_date::TIMESTAMPTZ AT TIME ZONE '#{timezone}'::INTERVAL
    #   )::date AS reminder_day,
    #   DATE_TRUNC('Day',
    #              end_date::TIMESTAMPTZ AT TIME ZONE '#{timezone}'::INTERVAL
    #   )::date AS reminder_day_end
    # ").group('reminder_day', 'reminder_day_end').order('reminder_day')

    # days_with_reminders = MetaSlot.select("start_date").union(MetaSlot.select("end_date"))

    # pp days_with_reminders.class

    # pp group.slots.includes(:meta_slot).references(:meta_slot).select("start_date")
    # days_with_reminders = group.slots.joins(:meta_slot).select("start_date, end_date AS pee")

    start_days = group.slots.joins(:meta_slot).select("
      DISTINCT DATE_TRUNC('Day',
                 start_date::TIMESTAMPTZ AT TIME ZONE '#{@timezone}'::INTERVAL
      )::date AS days
     ")#.group('days')

    end_days = group.slots.joins(:meta_slot).select("
      DISTINCT DATE_TRUNC('Day',
                 end_date::TIMESTAMPTZ AT TIME ZONE '#{@timezone}'::INTERVAL
      )::date AS days")

    result = start_days.map(&:days) | end_days.map(&:days)
    # pp start_days.class
    # pp result
    # pp start_days.size

    # long_slots = group.slots.joins(:meta_slot).selec("age(start_date, end_date) > 1 day")
    long_slots = group.slots.joins(:meta_slot).select("
      DATE_TRUNC('Day',
                 end_date::TIMESTAMPTZ AT TIME ZONE '#{@timezone}'::INTERVAL
      )::date -
      DATE_TRUNC('Day',
                 start_date::TIMESTAMPTZ AT TIME ZONE '#{@timezone}'::INTERVAL
      )::date AS duration
    ")

    # long_slots = group.slots.joins(:meta_slot).select("
    #   start_date - end_date::date AS duration")

    long_slots.map(&:duration)

    # xx = days_with_reminders.map do |r|
    #   [
    #     Time.zone.parse(r.attributes_before_type_cast['reminder_day']),
    # #     r.reminder_names
    #   ]
    # end
    result
  end

  def multi_day_slots(group:)
    # this includes slots which have the enddate on the day after startdate
    slots_on_several_days = group.slots.joins(:meta_slot).where("
      DATE_TRUNC('Day',
                 start_date::TIMESTAMPTZ AT TIME ZONE '#{@timezone}'::INTERVAL
      )::date !=
      DATE_TRUNC('Day',
                 end_date::TIMESTAMPTZ AT TIME ZONE '#{@timezone}'::INTERVAL
      )::date
      ")

    # slots_on_several_days.map do |slot|
    #   pp "#{slot.title}, #{slot.start_date}, #{slot.end_date}"
    # end
    slots_on_several_days
  end

  def three_plus_day_slots(group:)
    # gets the duration of a slot in the specific timezone,
    # then collects all slots which span more than two days
    # for those slots it's not enough to just use the stardate and enddate
    slots_on_several_days = group.slots.joins(:meta_slot).where("
      DATE_TRUNC('Day',
                 end_date::TIMESTAMPTZ AT TIME ZONE '#{@timezone}'::INTERVAL
      )::date -
      DATE_TRUNC('Day',
                 start_date::TIMESTAMPTZ AT TIME ZONE '#{@timezone}'::INTERVAL
      )::date >= 2
      ")

    # slots_on_several_days.map do |slot|
    #   pp "#{slot.title}, #{slot.start_date}, #{slot.end_date}"
    # end

    slots_on_several_days
  end

  def series_for_three_plus_day_slots(group:)
    # gets the duration of a slot in the specific timezone,
    # then collects all slots which span more than two days
    # for those slots it's not enough to just use the stardate and enddate
    slots_on_several_days = group.slots.joins(:meta_slot).where("
      DATE_TRUNC('Day',
                 end_date::TIMESTAMPTZ AT TIME ZONE '#{@timezone}'::INTERVAL
      )::date -
      DATE_TRUNC('Day',
                 start_date::TIMESTAMPTZ AT TIME ZONE '#{@timezone}'::INTERVAL
      )::date >= 2
      ")

    # slots_on_several_days.map do |slot|
    #   pp "#{slot.title}, #{slot.start_date}, #{slot.end_date}"
    # end

    slots_on_several_days
  end

  def dates_series(group:)
    # slots_on_several_days = group.slots.joins(:meta_slot).where("
    dates = ActiveRecord::Base.connection.execute("
      SELECT * FROM (generate_series('2008-03-01 00:00'::timestamp,
                                    '2008-03-04 12:00', '10 hours')) AS foo::date
    ")
    # dates.each do |d| pp d end
    dates
  end

  # collects all dates of slots which are longer than 2 days
  def date_series_for_slots2(slot_collection:)
    query = slot_collection.select(
      "(generate_series(start_date::date, end_date::date, '1 day'))::DATE AS date"
    ).distinct.where(
      "DATE_TRUNC('Day',
                  end_date::TIMESTAMPTZ AT TIME ZONE '#{@timezone}'::INTERVAL
      )::date -
      DATE_TRUNC('Day',
                 start_date::TIMESTAMPTZ AT TIME ZONE '#{@timezone}'::INTERVAL
      )::date >= 2"
    ).to_sql
    # ).order('date').to_sql
    dates = ActiveRecord::Base.connection.execute(query)
    # binding.pry
    # dates
    # dates.column_values(0)
    dates.field_values('date').sort
    # dates.values.flatten
    # dates.each do |d| pp d end
    # pp dates.each(&:values)
  end

  # collects all dates where a slot is
  # maybe this uses to much memory because all slots from
  # the collection are loaded :(
  def date_series_for_slots3(slot_collection:)
    slot_collection.select(
      "(generate_series(start_date::date, end_date::date, '1 day'))::DATE AS dates"
    ).distinct.map(&:dates)
  end
end
