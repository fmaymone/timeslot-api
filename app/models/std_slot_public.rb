class StdSlotPublic < StdSlot
  self.table_name = 'std_slots'

  def self.visibility
    'public'
  end

  def self.policy_class
    StdSlotPolicy
  end
end
