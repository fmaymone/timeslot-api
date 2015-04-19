class StdSlotPublic < StdSlot
  self.table_name = 'std_slots'

  # for Pundit
  def self.policy_class
    StdSlotPolicy
  end
end
