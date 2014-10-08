class Slot < ActiveRecord::Base
  belongs_to :baseslot, inverse_of: :slots

  validates :baseslot, presence: true
  validates :visibility, presence: true
  validates :alerts, presence: true
end
