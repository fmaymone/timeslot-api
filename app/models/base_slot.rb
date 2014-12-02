class BaseSlot < ActiveRecord::Base
  # this class is not intended to be used directly
  # but rather as an uniform interface for the specific slot representations
  # it shares postgres inheritance semantics at the db level with its subtypes
  after_commit AuditLog

  scope :active, -> { where(deleted_at: nil) }

  has_many :media_items, as: :mediable, dependent: :destroy
  belongs_to :meta_slot

  delegate :title, to: :meta_slot
  delegate :startdate, to: :meta_slot
  delegate :enddate, to: :meta_slot
  delegate :creator, to: :meta_slot
end
