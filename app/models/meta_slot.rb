class MetaSlot < ActiveRecord::Base
  belongs_to :user, inverse_of: :meta_slots
  belongs_to :slot, inverse_of: :meta_slots

  validates :user, presence: true
  validates :slot, presence: true
end
