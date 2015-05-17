class StdSlotFriends < StdSlot
  self.table_name = 'std_slots'

  def self.visibility
    'friends'
  end

  def self.policy_class
    super
  end
end
