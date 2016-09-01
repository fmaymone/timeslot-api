class DatesCollector
  def initialize(current_user: nil, timezone: nil)
    @current_user = current_user
    @timezone = timezone || Time.zone.now.utc.formatted_offset
  end

  def special_set_slots_dates(uuid:)
    return [] unless @current_user
    special_sets = @current_user.slot_sets.invert

    case special_sets[uuid]
    when 'my_cal_uuid'
      collections = [@current_user.my_calendar_slots]
    when 'my_lib_uuid'
      collections = PresentableSlots.call(relationship: ME, user: @current_user)
    when 'friends_cal_uuid'
      collections = PresentableSlots.friends_slots(user: @current_user)
    else
      collections = []
    end

    collect_dates(collections)
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

  # takes the timezone send by the client into account
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
end
