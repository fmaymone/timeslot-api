class CounterService
  # a service for counting objects in the database

  def active_visible_calendars(asker: , requestee:)
    return requestee.active_groups.count if asker == requestee

    public_calendars = requestee.active_groups.where(public: true).count
    my_groups = asker.active_group_ids
    shared_nonpublic_calendars = requestee.active_groups.find(my_groups).count
    public_calendars + shared_nonpublic_calendars
  end
end
