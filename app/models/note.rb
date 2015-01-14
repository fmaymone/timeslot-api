class Note < ActiveRecord::Base
  after_commit AuditLog
  after_validation :propagate_error, on: [:create, :update],
                   if: proc { |note| note.errors.any? && note.base_slot }

  belongs_to :base_slot, inverse_of: :notes

  validates :base_slot, presence: true
  validates :title, presence: true # max length?
  validates :content, presence: true # max length?

  private def propagate_error
    base_slot.errors.add(:note, errors)
  end

  # if belonging slot is deleted
  def delete
    SoftDelete.call(self)
  end
end
