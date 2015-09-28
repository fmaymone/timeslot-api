class Like < Activity
  after_commit AuditLog

  belongs_to :user
  belongs_to :slot, class_name: BaseSlot, foreign_key: "base_slot_id",
             inverse_of: :likes
  validates_presence_of :user, :slot

  def delete
    update(deleted_at: Time.zone.now)
  end
end
