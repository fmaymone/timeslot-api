class SlotSetting < ActiveRecord::Base
  belongs_to :user, inverse_of: :slot_settings
  belongs_to :meta_slot, inverse_of: :slot_settings

  delegate :title, to: :meta_slot
  delegate :startdate, to: :meta_slot
  delegate :enddate, to: :meta_slot
  delegate :creator, to: :meta_slot

  validates :user, presence: true
  validates :meta_slot, presence: true
end
