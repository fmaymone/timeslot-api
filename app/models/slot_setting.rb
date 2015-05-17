class SlotSetting < ActiveRecord::Base
  after_commit AuditLog

  belongs_to :user, inverse_of: :slot_settings
  belongs_to :meta_slot, inverse_of: :slot_settings

  validates :user, presence: true
  validates :meta_slot, presence: true

  # delete if user deletes all representations of the specific meta_slot
  # delete if user deactivates his profile
  def delete
    ts_soft_delete
  end

  # undelete if user re-activates his profile
  # def undelete
  #   update(deleted_at: nil) if user.representation?(meta_slot)
  # end
end
