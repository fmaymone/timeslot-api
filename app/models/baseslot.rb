class Baseslot < ActiveRecord::Base

  validates :title, presence: true, length: { maximum: 48 }
  validates :startdate, presence: true
  validates :enddate, presence: true
end
