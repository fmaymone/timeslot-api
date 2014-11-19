class Slot < ActiveRecord::Base
  has_many :media_items, as: :mediable, dependent: :destroy

  has_many :slot_settings, inverse_of: :slot
  has_many :users, through: :slot_settings, source: :user

  validates :title, presence: true, length: { maximum: 48 }
  validates :startdate, presence: true
  validates :enddate, presence: true
  validates :note, length: { maximum: 500 }
  validates :visibility, presence: true
  validate :enddate_is_after_startdate

  private def enddate_is_after_startdate
    return false if enddate.blank? || startdate.blank?
    return true if startdate.to_i < enddate.to_i
    errors.add(:enddate, "cannot be before the start date")
  end
end

# class MetaSlot
#   creator
#   title
#   startdate
#   enddate
#   location
#   reslot counter
# end

# class Slot
#   created_at
#   updated_at
#   deleted_at
# end

# class GroupSlot < Slot
#   #  set_table_name 'group_slots'
#   group_id
#   likes
#   comments
#   note
#   media_items
# end

# class StdSlot < Slot
#   visiblity
#   note
#   media_items
# end

# class ReSlot < Slot
#   predecessor
# end
