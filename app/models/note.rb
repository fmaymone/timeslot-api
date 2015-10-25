class Note < ActiveRecord::Base
  include SlotActivity

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

  def activity_target
    slot
  end

  # The user who made the update
  def activity_actor
    creator
  end

  def activity_verb
    'note'
  end
end
