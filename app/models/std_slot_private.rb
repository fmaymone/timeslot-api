class StdSlotPrivate < StdSlot
  self.table_name = 'std_slots'

  def self.visibility
    'private'
  end

  def self.policy_class
    StdSlotPolicy
    # super
  end
end
