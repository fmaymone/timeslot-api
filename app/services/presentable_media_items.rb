class PresentableMediaItems
  # returns all slot collections current_user is allowed to see the
  # media_items of other user from, depending on their relationship
  def self.call(relationship:, user:, current_user: nil)
    case relationship
    when FRIEND
      [user.std_slots.unprivate]
       # user.shared_group_slots(current_user)]
    when FOAF
      [user.std_slots_foaf,
       user.std_slots_public]
       # user.shared_group_slots(current_user)]
    when STRANGER
      [user.std_slots_public]
       # user.shared_group_slots(current_user)]
    when VISITOR
      [user.std_slots_public]
    else
      fail ArgumentError
    end
  end
end
