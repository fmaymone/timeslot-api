class ReSlotFriends < ReSlot
  self.table_name = 're_slots'

  def self.visibility
    'friends'
  end
end
