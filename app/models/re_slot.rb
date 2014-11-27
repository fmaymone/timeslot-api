class ReSlot < BaseSlot
  self.table_name = 're_slots'

  belongs_to :slotter, class_name: User, inverse_of: :re_slots
  # unfortunately this will mostly be a ReSlot, maybe even a GroupSlot
  belongs_to :predecessor, class_name: StdSlot
  belongs_to :meta_slot

  validates :slotter, presence: true
  validates :predecessor, presence: true
  validates :meta_slot, presence: true
end
