class GroupSlotMembers < GroupSlot
  self.table_name = 'group_slots'

  def self.visibility
    'members'
  end
end
