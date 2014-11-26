class ReSlot < BaseSlot
  self.table_name = 're_slots'

  belongs_to :predecessor, class_name: User
  belongs_to :slot_setting

  delegate :title, to: :slot_setting
  delegate :startdate, to: :slot_setting
  delegate :enddate, to: :slot_setting
  delegate :creator, to: :slot_setting

  validates :predecessor, presence: true
  validates :slot_setting, presence: true
end
