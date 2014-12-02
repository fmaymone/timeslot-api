class SlotSetting < ActiveRecord::Base
  after_commit AuditLog

  belongs_to :user, inverse_of: :slot_settings
  belongs_to :meta_slot, inverse_of: :slot_settings

  validates :user, presence: true
  validates :meta_slot, presence: true
end
