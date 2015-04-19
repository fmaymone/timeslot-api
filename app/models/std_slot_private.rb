class StdSlotPrivate < StdSlot
  self.table_name = 'std_slots'
  # default_scope { where(slot_type: 2) }
  # self.inheritance_column = 'slot_type'

  # for Pundit
  def self.policy_class
    StdSlotPolicy
    # super
  end
end
