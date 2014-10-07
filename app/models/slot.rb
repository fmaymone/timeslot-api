class Slot < ActiveRecord::Base
  belongs_to :baseslot

  validates :visibility, presence: true
  validates :alerts, presence: true
end
