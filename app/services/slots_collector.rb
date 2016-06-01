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

  # collects all created by, tagged to, in my_calendar
  # or in a group of current_user
  def my_library_slots(user:)
    valid_collections = PresentableSlots.call(relationship: ME, user: user)
    consider_mode(valid_collections, @mode)
  end

  # collects all passengerships of current_user
  def my_schedule_slots(user:)
    valid_collections = [user.my_calendar_slots]
    consider_mode(valid_collections, @mode)
  end

  # collects all slots current_user or visitor is allowed to see from
  # requested_user including std_slots public group slots and shared group slots
  def user_slots(current_user: nil, user:)
    # determine relation to current_user
    relationship = UserRelationship.call(current_user.try(:id), user.id)

    # get showable slot collections
    valid_collections = PresentableSlots.call(relationship: relationship,
                                              user: user,
                                              current_user: current_user)

    consider_mode(valid_collections, @mode)
  end

  # get 4 upcoming slots from user which current_user is allowed to see
  # if not enough upcoming slots, also use past slots
  def user_preview_slots(current_user: nil, user:)
    # determine relation between user and current_user
    relationship = UserRelationship.call(current_user.try(:id), user.id)

    # get showable slot collections
    valid_collections = PresentableSlots.call(relationship: relationship,
                                              user: user,
                                              current_user: current_user)

    slots = query_data(valid_collections, 'upcoming')
    count = slots.count
    # if we don't get enough upcoming slots, add some slots from the past
    if count < 4
      past_slots = query_data(valid_collections, 'past', 4 - count)
      limited_past_slots = sort_result(past_slots, 'past')
      slots += limited_past_slots
    end
    sort_result(slots, 'upcoming')
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
    # pool size: number of valid results, is need to know when to send a cursor
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

    sorted_pasts + sorted_upcomings
  end

  private def query_data(relations, mode, limit = @limit)
    data = []

    ### fetch slots
    relations.each do |relation|
      next unless relation
      # try to eager load relations needed for view rendering
      full_relation = if relation.model <= BaseSlot
                        relation.includes(
                          :notes, :media_items,
                          meta_slot: [:ios_location, :creator]
                        )
                      else
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
    ### remove duplicates, because the same slot can be in multiple collections
    data.uniq!

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
