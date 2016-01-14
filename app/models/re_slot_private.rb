class ReSlotPrivate < ReSlot
  self.table_name = 're_slots'

  def self.visibility
    'private'
  end
end
