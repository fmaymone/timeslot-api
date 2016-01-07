class PresentableSlots
  # returns all slot collections current_user is allowed to see from some other
  # user depending on their specific relationship
  def self.call(relationship:, user:, current_user: nil)
    case relationship
    when FRIEND
      # includes public, friend-visible and friend-of-friend (foaf) visible
      # std_slots, public, friend-visible and foaf-visible
      # reslots and shared group_slots (between user and current_user)
      [user.std_slots.unprivate,
       user.re_slots.unprivate,
       current_user.shared_group_slots(user)]
    when FOAF
      # includes public and friend-of-friend (foaf) visible std_slots,
      # public and friend-of-friend-visible
      # reslots and shared group_slots (between user and current_user)
      [user.std_slots_public, user.std_slots_foaf,
       user.re_slots_public, user.re_slots_foaf,
       current_user.shared_group_slots(user)]
    when STRANGER
      # includes public std_slots, public reslots and shared
      # group_slots between user and current_user
      [user.std_slots_public, user.re_slots_public,
       current_user.shared_group_slots(user)]
    when VISITOR
      # includes public std_slots and public reslots
      [user.std_slots_public, user.re_slots_public]
    end
  end

  def self.std_slots(relationship:, user:)
    case relationship
    when ME
      [user.std_slots]
    when FRIEND
      # TODO: use 'unprivate' scope here
      [user.std_slots_public, user.std_slots_friends, user.std_slots_foaf]
    when FOAF
      [user.std_slots_public, user.std_slots_foaf]
    when STRANGER, VISITOR
      [user.std_slots_public]
    end
  end
end
