class Comment < SlotActivity
  after_commit AuditLog

  belongs_to :slot, class_name: BaseSlot, inverse_of: :comments
  belongs_to :user

  validates_presence_of :user, :slot, :content
  validates :content, length: { maximum: 5000 }

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
    'comment'
  end

  # The message is used as a notification message
  # for the users activity feed
  def activity_message
    I18n.t('activity_comment', name: user.username, title: slot.meta_slot.title)
  end
end
