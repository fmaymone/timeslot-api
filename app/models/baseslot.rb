class Baseslot < ActiveRecord::Base
  has_many :slots, inverse_of: :baseslot

  validates :title, presence: true, length: { maximum: 48 }
  validates :startdate, presence: true
  validates :enddate, presence: true
end
