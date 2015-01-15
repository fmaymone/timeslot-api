class MetaSlot < ActiveRecord::Base
  after_commit AuditLog

  belongs_to :creator, class_name: "User", inverse_of: :created_slots

  has_many :slot_settings, inverse_of: :meta_slot
  # TODO: I think I don't need this, remove after alarm stuff is in place
  # has_many :users, through: :slot_settings, source: :user

  validates :creator, presence: true
  validates :title, presence: true, length: { maximum: 48 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :enddate_is_after_startdate

  def location
    Location.find(location_id)
  end

  private def enddate_is_after_startdate
    return false if end_date.blank? || start_date.blank?
    return true if start_date.to_i < end_date.to_i
    errors.add(:end_date, "can't be before start_date")
  end
end
