class SlotsCollector
  # because the defaults are not set if no pagination parameters are send,
  # I have to set them here again unfortunately
  def initialize(limit: PAGINATION_DEFAULT_LIMIT,
                 filter: PAGINATION_DEFAULT_FILTER,
                 moment: Time.zone.now,
                 after: nil,
                 before: nil)
    @limit = filter == 'around' ? limit.to_i / 2 : limit.to_i
    @filter = filter
    @moment = moment
    @before = before
    @after = after

    return self unless @after || @before

    encoded_cursor = (@after || @before)
    @cursor = BaseSlot.from_paging_cursor encoded_cursor if encoded_cursor
    @direction = @after.nil? ? 'before' : 'after'
  end

  # collects all std_slots of current_user
  def my_slots(user:)
    showables = [user.std_slots]
    consider_filter(showables, @filter)
  end

  # collects all passengerships of current_user
  def my_schedule_slots(user:)
    showables = [user.my_calendar_slots]
    consider_filter(showables, @filter)
  end

  # collects all slots current_user or visitor is allowed to see from
  # requested_user including std_slots, reslots and shared group_slots
  def user_slots(current_user: nil, user:)
    # determine relation to current_user
    relationship = UserRelationship.call(current_user.try(:id), user.id)

    return my_slots(user: current_user) if relationship == ME

    # get showable slot collections
    showables = PresentableSlots.call(relationship: relationship, user: user,
                                      current_user: current_user)

    consider_filter(showables, @filter)
  end

  # collects all non-private slots from all friends of the current_user
  def slots_from_friends(user:)
    # ALTERNATIVE: to join on the db level:
    # friends = UserQuery::Relationship.new(current_user.id).my_friends
    friends = UserQuery::Relationship.new(user.id).my_friends.to_a

    showables = [StdSlot.where(owner: friends).unprivate]
                 # ReSlot.where(slotter: friends).unprivate]
    consider_filter(showables, @filter)
  end

  # collects only active std_slots current_user or visitor is allowed to
  # see from requested_user, currently this is only used for counting, so
  # I skip the pagination functionality
  def active_slots_count(current_user: nil, user:, slot_class: StdSlot)
    rs = UserRelationship.call(current_user.try(:id), user.id)

    if slot_class == StdSlot
      showables = PresentableSlots.std_slots(relationship: rs, user: user)
    # elsif slot_class == ReSlot
      # showables = PresentableSlots.re_slots(relationship: rs, user: user)
    end

    counter = 0
    showables.each { |relation| counter += relation.active.count }
    counter
  end

  private def consider_filter(relations, filter)
    if filter == 'around'
      around_filter_query(relations)
    else
      slots = query_data(relations, filter)
      sort_result(slots, filter)
    end
  end

  # the 'around' filter needs special treatmeant because he returns forward
  # and backward facing data/slots (with regard to the 'moment')
  private def around_filter_query(relations)
    upcomings = query_data(relations, 'upcoming')
    sorted_upcomings = sort_result(upcomings, 'upcoming')

    pasts = query_data(relations, 'past')
    sorted_pasts = sort_result(pasts, 'past')

    sorted_upcomings + sorted_pasts
  end

  private def query_data(relations, filter)
    data = []

    ### fetch slots
    relations.each do |relation|
      next unless relation
      full_relation = if relation.table_name == StdSlot.table_name
                        relation.includes(
                          :notes, :media_items,
                          meta_slot: [:ios_location, :creator])
                      # elsif relation.table_name == ReSlot.table_name
                      #   relation.includes(
                      #     parent: [:notes, :media_items],
                      #     meta_slot: [:ios_location, :creator])
                      else
                        # groupslots ...
                        relation
                      end

      ### initialize query object
      query = SlotQuery::OwnSlots.new(relation: full_relation,
                                      direction: @direction)

      ### build and execute query
      # get [limit] slots from all collections, not efficient but simple
      # and definitly working, TODO: optimize when need is
      slots = query.retrieve(filter: filter,
                             moment: @moment,
                             cursor: @cursor).limit(@limit)
      data.concat(slots)
    end
    data
  end

  private def sort_result(data, filter)
    ### order retrieved slots by startdate, enddate and id
    data.sort_by! { |slot| [slot.start_date, slot.end_date, slot.id] }

    ### and return the first/last [limit] slots from the collection
    if @before || (filter == 'past') || (filter == 'finished')
      data.last @limit
    else
      data.take @limit
    end
  end
end
