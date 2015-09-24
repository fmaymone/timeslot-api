class SlotsCollector
  # collects all slots current_user is allowed to see from requested_user
  # including std_slots, reslots and groupslots
  def self.call(current_user: nil, user:, limit: 20, status: 'all',
                moment: Time.zone.now)
    # determine relation to current_user
    relationship = UserRelationship.call(current_user.try(:id), user.id)

    # get showable slot collections
    showables = PresentableSlots.call(relationship: relationship, user: user,
                                      current_user: current_user)
    data = []

    ### fetch slots
    showables.each do |relation|
      ### initialize query object
      query = SlotQuery::OwnSlots.new(relation: relation)

      ### execute query
      # get [limit] slots from all collections, not efficient but simple
      # and definitly working, TODO: optimize when need is
      slots = query.retrieve(status: status, moment: moment).paginate(limit).ordered
      data.concat(slots)
    end

    ### order retrieved slots by startdate, enddate and id
    data.sort_by! { |slot| [slot.start_date, slot.end_date, slot.id] }

    ### and return the first [limit] slots from the collection
    # is any of those prefered over the others?
    # data.first limit
    # data[0, limit]
    # data.take limit
    data.take limit.to_i
  end
end
