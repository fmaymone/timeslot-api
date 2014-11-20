class BaseSlot < ActiveRecord::Base
  attr_accessor :footest, :meta_slot

  belongs_to :meta_slot, inverse_of: :base_slot

  delegate :startdate, to: :meta_slot

  validates :meta_slot, presence: true
end
