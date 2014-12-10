class MetaSlot < ActiveRecord::Base
  after_commit AuditLog

  belongs_to :creator, class_name: "User", inverse_of: :created_slots

  has_many :slot_settings, inverse_of: :meta_slot
  # TODO: I think I don't need this, remove after alarm stuff is in place
  # has_many :users, through: :slot_settings, source: :user

  validates :creator, presence: true
  validates :title, presence: true, length: { maximum: 48 }
  validates :startdate, presence: true
  validates :enddate, presence: true
  validate :enddate_is_after_startdate

  private def enddate_is_after_startdate
    return false if enddate.blank? || startdate.blank?
    return true if startdate.to_i < enddate.to_i
    errors.add(:enddate, "cannot be before the start date")
  end
end
