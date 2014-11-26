class StdSlot < BaseSlot
  self.table_name = 'std_slots'

  belongs_to :slot_setting

  delegate :title, to: :slot_setting
  delegate :startdate, to: :slot_setting
  delegate :enddate, to: :slot_setting
  delegate :creator, to: :slot_setting

  validates :slot_setting, presence: true
end
