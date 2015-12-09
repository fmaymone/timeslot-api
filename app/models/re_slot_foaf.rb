class ReSlotFoaf < ReSlot
  self.table_name = 're_slots'

  def self.visibility
    'foaf'
  end
end
