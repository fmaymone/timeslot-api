class CounterService
  # a service for counting objects in the database

  # counts the slots current_user or visitor is allowed to
  # see from requested_user
  # (corresponds to the number of slots returned by 'users/:id/slots')
  # -> wegen potentieller duplicates kann man sich nicht auf das count
  #    der datenbank verlassen. ich muss alle slot ids einsammeln und zaehlen
  def active_slots(current_user: nil, user:)
    relationship = UserRelationship.call(current_user.try(:id), user.id)
    collections = PresentableSlots.call(relationship: relationship,
                                        user: user, current_user: current_user)
    slot_ids = []
    collections.each { |slots| slot_ids |= slots.active.pluck(:id) }
    slot_ids.count
  end

  def active_calendars(current_user: nil, user:)
    public_calendars = user.active_groups.where(public: true)
    return public_calendars.count unless current_user
    return user.active_groups.count if user == current_user

    my_group_ids = current_user.active_group_ids
    shared_nonpublic_calendars = user.active_groups.where(id: my_group_ids,
                                                          public: false)
    public_calendars.count + shared_nonpublic_calendars.count
  end

  def number_of_users_who_can_view_the_slot(slot)
    return 'all' if slot.visibility == 'public'

    viewer_ids = [slot.owner_id]
    viewer_ids += slot.owner.friends_ids if slot.StdSlotFriends?

    group_members = Membership.active.where(group_id: slot.slot_group_ids)
                              .pluck(:user_id)
    viewer_ids += group_members

    # atm I'm counting all users with undeleted passengerships here, which means
    # all users who were tagged or who have put the slot in their schedule
    tagged_users = Passengership.active.where(slot_id: slot.id).pluck(:user_id)
    viewer_ids += tagged_users

    viewer_ids.uniq.count
  end
end
