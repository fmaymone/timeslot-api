class GroupSlotPublic < GroupSlot
  self.table_name = 'group_slots'

  def self.visibility
    'public'
  end
end
