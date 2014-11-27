class BaseSlot < ActiveRecord::Base
  has_many :media_items, as: :mediable, dependent: :destroy

  delegate :title, to: :meta_slot
  delegate :startdate, to: :meta_slot
  delegate :enddate, to: :meta_slot
  delegate :creator, to: :meta_slot
end
