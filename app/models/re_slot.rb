class ReSlot < BaseSlot
  self.table_name = 're_slots'

  belongs_to :meta_slot

  validates :meta_slot, presence: true
end
