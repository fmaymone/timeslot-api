class Note < ActiveRecord::Base
  after_commit AuditLog
  after_validation :propagate_error, on: [:create, :update],
                   if: proc { |note| note.errors.any? && note.slot }

  belongs_to :slot, class_name: BaseSlot, foreign_key: "base_slot_id",
             inverse_of: :notes

  validates :slot, presence: true
  validates :title, presence: true # max length?
  validates :content, presence: true # max length?
  validates :creator_id, presence: true
  validates :media_type, presence: true

  private def propagate_error
    slot.errors.add(:note, errors)
  end

  def media_type
    'note'
  end

  # if belonging slot is deleted
  def delete
    ts_soft_delete
  end
end
