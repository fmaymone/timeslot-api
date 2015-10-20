class Like < SlotActivity
  after_commit AuditLog

  belongs_to :user
  belongs_to :slot, class_name: BaseSlot, foreign_key: "base_slot_id",
             inverse_of: :likes
  validates_presence_of :user, :slot

  def delete
    update(deleted_at: Time.zone.now)
  end

  ## Activity Methods ##

  private

  def activity_slot
    slot
  end

  def activity_user
    user
  end

  def activity_verb
    'like'
  end
end
