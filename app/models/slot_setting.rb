class SlotSetting < ActiveRecord::Base
  belongs_to :user, inverse_of: :slot_settings
  belongs_to :meta_slot, inverse_of: :slot_settings

  validates :user, presence: true
  validates :meta_slot, presence: true
end
