class Slot < ActiveRecord::Base
  belongs_to :baseslot, inverse_of: :slots

  validates :visibility, presence: true
  validates :alerts, presence: true
end
