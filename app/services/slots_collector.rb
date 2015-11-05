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

  # demo slots / public standard slots
  def latest_public_slots
    collection = [StdSlotPublic.all]
    consider_filter(collection, @filter)
  end

  # collects all slots current_user is allowed to see from requested_user
  # including std_slots, reslots
  def my_slots(current_user: nil, user:)
    # determine relation to current_user
    relationship = UserRelationship.call(current_user.try(:id), user.id)

    # get showable slot collections
    showables = PresentableSlots.call(relationship: relationship, user: user,
                                      current_user: current_user)

    consider_filter(showables, @filter)
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

      ### initialize query object
      query = SlotQuery::OwnSlots.new(relation: relation, direction: @direction)

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
