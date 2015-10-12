class SlotsCollector
  def initialize(limit: 40, filter: 'upcoming', moment: Time.zone.now,
                 after: nil, before: nil)
    @limit = limit.to_i
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
    sort_result query_data([StdSlotPublic.all])
  end

  # collects all slots current_user is allowed to see from requested_user
  # including std_slots, reslots
  # TODO: add groupslots
  def my_slots(current_user: nil, user:)
    # determine relation to current_user
    relationship = UserRelationship.call(current_user.try(:id), user.id)

    # get showable slot collections
    showables = PresentableSlots.call(relationship: relationship, user: user,
                                      current_user: current_user)

    sort_result query_data(showables)
  end

  def query_data(relations)
    data = []

    ### fetch slots
    relations.each do |relation|
      ### initialize query object
      query = SlotQuery::OwnSlots.new(relation: relation, direction: @direction)

      ### build and execute query
      # get [limit] slots from all collections, not efficient but simple
      # and definitly working, TODO: optimize when need is
      slots = query.retrieve(filter: @filter,
                             moment: @moment,
                             cursor: @cursor).limit(@limit)
      data.concat(slots)
    end
    data
  end

  def sort_result(data)
    ### order retrieved slots by startdate, enddate and id
    data.sort_by! { |slot| [slot.start_date, slot.end_date, slot.id] }

    ### and return the first/last [limit] slots from the collection
    if @before || (@filter == 'past') || (@filter == 'finished')
      data.last @limit
    else
      data.take @limit
    end
  end
end
