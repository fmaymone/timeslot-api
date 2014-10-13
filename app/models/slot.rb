class Slot < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 48 }
  validates :startdate, presence: true
  validates :enddate, presence: true
  validates :note, length: { maximum: 500 }
  validates :visibility, presence: true
  validates :alerts, presence: true
end
