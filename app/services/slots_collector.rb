class SlotsCollector
  # TODO: refactoring

  # demo slots / public standard slots
  def self.latest_public_slots(limit: 40, status: 'upcoming',
                               moment: Time.zone.now, after: nil, before: nil)
    if after || before
      encoded_cursor = (after || before)
      cursor = BaseSlot.from_paging_cursor encoded_cursor if encoded_cursor
      direction = after.nil? ? 'before' : 'after'
    end

    ### initialize query object
    query = SlotQuery::OwnSlots.new(relation: StdSlotPublic.all,
                                    direction: direction)

    ### build and execute query
    data = query.retrieve(status: status,
                          moment: moment,
                          cursor: cursor).limit(limit.to_i).to_a

    ### order retrieved slots by startdate, enddate and id
    data.sort_by! { |slot| [slot.start_date, slot.end_date, slot.id] }

    ### and return the first/last [limit] slots from the collection
    if before || (status == 'past')
      data.last limit.to_i
    else
      data.take limit.to_i
    end
  end

  # collects all slots current_user is allowed to see from requested_user
  # including std_slots, reslots
  # TODO: add groupslots
  # class MySlots
  def self.my_slots(current_user: nil, user:, limit: 40, status: 'upcoming',
                    moment: Time.zone.now, after: nil, before: nil)

    if after || before
      encoded_cursor = (after || before)
      cursor = BaseSlot.from_paging_cursor encoded_cursor if encoded_cursor
      direction = after.nil? ? 'before' : 'after'
    end

    # determine relation to current_user
    relationship = UserRelationship.call(current_user.try(:id), user.id)

    # get showable slot collections
    showables = PresentableSlots.call(relationship: relationship, user: user,
                                      current_user: current_user)
    data = []

    ### fetch slots
    showables.each do |relation|
      ### initialize query object
      query = SlotQuery::OwnSlots.new(relation: relation, direction: direction)

      ### execute query
      # get [limit] slots from all collections, not efficient but simple
      # and definitly working, TODO: optimize when need is
      slots = query.retrieve(status: status,
                             moment: moment,
                             cursor: cursor).limit(limit.to_i)

      data.concat(slots)
    end

    ### order retrieved slots by startdate, enddate and id
    data.sort_by! { |slot| [slot.start_date, slot.end_date, slot.id] }

    ### and return the first/last [limit] slots from the collection
    if before || (status == 'past')
      data.last limit.to_i
    else
      data.take limit.to_i
    end
  end
end
