class SlotSetting < ActiveRecord::Base
  belongs_to :user, inverse_of: :slot_settings
  belongs_to :slot, inverse_of: :slot_settings

  validates :user, presence: true
  validates :slot, presence: true
  validates :alerts, presence: true
end
