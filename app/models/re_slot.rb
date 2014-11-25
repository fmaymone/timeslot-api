class ReSlot < BaseSlot
  self.table_name = 're_slots'

  belongs_to :predecessor, class_name: User
  belongs_to :meta_slot

  validates :predecessor, presence: true
  validates :meta_slot, presence: true
end
