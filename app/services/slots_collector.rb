class SlotsCollector
  Result = ImmutableStruct.new([:data], :pool_size, :error_messages)

  # because the defaults are not set if no pagination parameters are send,
  # I have to set them here again unfortunately
  def initialize(limit: PAGINATION_DEFAULT_LIMIT,
                 mode: PAGINATION_DEFAULT_MODE,
                 filter: PAGINATION_DEFAULT_FILTER,
                 moment: Time.zone.now,
                 after: nil,
                 before: nil,
                 earliest: nil,
                 latest: nil)
    @limit = mode == 'around' ? limit.to_i / 2 : limit.to_i
    @mode = mode
    @filter = filter
    @moment = moment
    @before = before
    # @after = after
    @earliest = earliest
    @latest = latest

    return self unless after || @before

    encoded_cursor = (after || @before)
    @cursor = BaseSlot.from_paging_cursor encoded_cursor if encoded_cursor
    @direction = after.nil? ? 'before' : 'after'
  end

  # collects all std_slots of current_user
  def my_slots(user:)
    valid_collections = [user.std_slots]
    consider_mode(valid_collections, @mode)
  end

  # collects all passengerships of current_user
  def my_schedule_slots(user:)
    valid_collections = [user.my_calendar_slots]
    consider_mode(valid_collections, @mode)
  end

  # collects all slots current_user or visitor is allowed to see from
  # requested_user including std_slots, reslots and shared group_slots
  def user_slots(current_user: nil, user:)
    # determine relation to current_user
    relationship = UserRelationship.call(current_user.try(:id), user.id)

    return my_slots(user: current_user) if relationship == ME

    # get showable slot collections
    valid_collections = PresentableSlots.call(relationship: relationship,
                                              user: user,
                                              current_user: current_user)

    consider_mode(valid_collections, @mode)
  end

  # collects all non-private slots from all friends of the current_user
  def slots_from_friends(user:)
    # ALTERNATIVE: to join on the db level:
    # friends = UserQuery::Relationship.new(current_user.id).my_friends
    friends = UserQuery::Relationship.new(user.id).my_friends.to_a

    valid_collections = [StdSlot.where(owner: friends).unprivate]
                         # ReSlot.where(slotter: friends).unprivate]
    consider_mode(valid_collections, @mode)
  end

  # collects only active std_slots current_user or visitor is allowed to
  # see from requested_user, currently this is only used for counting, so
  # I skip the pagination functionality
  def active_slots_count(current_user: nil, user:, slot_class: StdSlot)
    rs = UserRelationship.call(current_user.try(:id), user.id)

    if slot_class == StdSlot
      valid_collections = PresentableSlots.std_slots(relationship: rs,
                                                     user: user)
    # elsif slot_class == ReSlot
      # valid_collections = PresentableSlots.re_slots(relationship: rs,
      #                                               user: user)
    end

    counter = 0
    valid_collections.each { |relation| counter += relation.active.count }
    counter
  end

  # TODO: write specs
  def group_slots(group:)
    valid_collections = [group.slots_with_associations]
    consider_mode(valid_collections, @mode)
  end

  # decreases the collection which is operated upon
  private def apply_filter(relation, filter)
    if filter == 'between'
      query = SlotQuery::OwnSlots.new(relation: relation, direction: nil)
      query.retrieve(mode: 'between', earliest: @earliest, latest: @latest)
    else
      relation
    end
  end

  private def consider_mode(relations, mode)
    filtered_relations = []
    pool_size = 0

    relations.each do |relation|
      filtered_relation = @filter ? apply_filter(relation, @filter) : relation
      pool_size += filtered_relation.size
      filtered_relations << filtered_relation
    end

    # shortcut: if we don't have any valid slots, don't do the query
    return Result.new(pool_size: 0) if pool_size == 0

    if mode == 'around'
      sorted_slots = around_mode_query(filtered_relations)
    else
      slots = query_data(filtered_relations, mode)
      sorted_slots = sort_result(slots, mode)
    end
    Result.new(data: sorted_slots, pool_size: pool_size)
  end

  # the 'around' mode needs special treatmeant because he returns forward
  # and backward facing data/slots (with regard to the 'moment')
  private def around_mode_query(relations)
    upcomings = query_data(relations, 'upcoming')
    sorted_upcomings = sort_result(upcomings, 'upcoming')

    pasts = query_data(relations, 'past')
    sorted_pasts = sort_result(pasts, 'past')

    sorted_upcomings + sorted_pasts
  end

  private def query_data(relations, mode)
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
      slots = query.retrieve(mode: mode,
                             moment: @moment,
                             cursor: @cursor).limit(@limit)
      data.concat(slots)
    end
    data
  end

  private def sort_result(data, mode)
    ### order retrieved slots by startdate, enddate and id
    data.sort_by! { |slot| [slot.start_date, slot.end_date, slot.id] }

    ### and return the first/last [limit] slots from the collection
    if @before || (mode == 'past') || (mode == 'finished')
      data.last @limit
    else
      data.take @limit
    end
  end
end
