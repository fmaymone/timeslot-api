class StdSlot < BaseSlot
  self.table_name = 'std_slots'

  belongs_to :meta_slot

  validates :meta_slot, presence: true
end
