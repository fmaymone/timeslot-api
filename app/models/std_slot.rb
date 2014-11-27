class StdSlot < BaseSlot
  self.table_name = 'std_slots'

  belongs_to :meta_slot, inverse_of: :std_slot

  validates :meta_slot, presence: true
end
