class Note < SlotActivity
  after_commit AuditLog
  after_validation :propagate_error, on: [:create, :update],
                   if: proc { |note| note.errors.any? && note.slot }

  belongs_to :slot, class_name: BaseSlot, foreign_key: "base_slot_id",
             inverse_of: :notes
  belongs_to :creator, class_name: User

  validates :slot, presence: true
  validates :title, presence: true # max length?
  validates :content, presence: true # max length?
  validates :creator, presence: true

  private def propagate_error
    slot.errors.add(:note, errors)
  end

  # if belonging slot is deleted
  def delete
    ts_soft_delete
  end

  ## Activity Methods ##

  private

  def activity_slot
    slot
  end

  # The user who made the update
  def activity_user
    creator
  end

  def activity_verb
    'note'
  end

  # The message is used as a notification message
  # for the users activity feed
  def activity_message
    I18n.t('activity_note', name: creator.username, type: activity_verb)
  end
end
