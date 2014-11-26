class ReSlot < BaseSlot
  self.table_name = 're_slots'

  belongs_to :predecessor, class_name: User
  belongs_to :meta_slot

  delegate :title, to: :meta_slot
  delegate :startdate, to: :meta_slot
  delegate :enddate, to: :meta_slot
  delegate :creator, to: :meta_slot

  validates :predecessor, presence: true
  validates :meta_slot, presence: true
end
