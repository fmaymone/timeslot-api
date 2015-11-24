class StdSlotFoaf < StdSlot
  self.table_name = 'std_slots'

  def self.visibility
    'foaf'
  end

  def self.policy_class
    super
  end
end
