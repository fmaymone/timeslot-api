class PresentableSlots
  # returns all slot collections current_user is allowed to see from some other
  # user depending on their specific relationship
  def self.call(relationship:, user:, current_user: nil)
    case relationship
    when 'himself'
      # include all std_slots and all reslots, but no group_slots
      [StdSlot.of(user.id), ReSlot.where(slotter: user)]
    when 'friend'
      # includes public and friend-visible std_slots, public and friend-visible
      # reslots and shared group_slots (between user and current_user)
      [user.std_slots_public, user.std_slots_friends,
       user.re_slots, current_user.shared_group_slots(user)]

    when 'stranger'
      # includes public std_slots, public reslots and shared
      # group_slots (between user and current_user -> if there is one)
      [user.std_slots_public, user.re_slots,
       current_user.try(:shared_group_slots, user)]
    end
  end
end
