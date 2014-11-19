class Slot < ActiveRecord::Base
  has_many :media_items, as: :mediable, dependent: :destroy

  has_many :meta_slots, inverse_of: :slot
  has_many :users, through: :meta_slots, source: :user

  validates :title, presence: true, length: { maximum: 48 }
  validates :startdate, presence: true
  validates :enddate, presence: true
  validates :note, length: { maximum: 500 }
  validates :visibility, presence: true
  validates :alerts, presence: true
  validate :enddate_is_after_startdate

  private def enddate_is_after_startdate
    return false if enddate.blank? || startdate.blank?
    return true if startdate.to_i < enddate.to_i
    errors.add(:enddate, "cannot be before the start date")
  end
end
