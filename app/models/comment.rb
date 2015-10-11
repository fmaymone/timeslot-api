class Comment < SlotActivity
  after_commit AuditLog

  belongs_to :slot, class_name: BaseSlot, inverse_of: :comments
  belongs_to :user

  validates_presence_of :user, :slot, :content
  validates :content, length: { maximum: 5000 }

  def delete
    update(deleted_at: Time.zone.now)
  end

  # The message is used as a notification message
  # for the users activity feed
  def activity_message
    "#{I18n.t('activity_create_comment', title: slot.meta_slot.title)}"
  end
end
