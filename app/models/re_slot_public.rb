class ReSlotPublic < ReSlot
  self.table_name = 're_slots'

  def self.visibility
    'public'
  end
end
