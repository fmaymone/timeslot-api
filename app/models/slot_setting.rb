class SlotSetting < ActiveRecord::Base
  # self.primary_key = [:user_id, :meta_slot_id]
  belongs_to :user, inverse_of: :slot_settings
  belongs_to :meta_slot, inverse_of: :slot_settings

  validates :user, presence: true
  validates :meta_slot, presence: true
  validates :alerts, presence: true
end
