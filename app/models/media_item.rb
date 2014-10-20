class MediaItem < ActiveRecord::Base
  belongs_to :slot

  validates :media_type, presence: true # , length: { maximum: 12 }
  validates :public_id, presence: true
  validates :ordering, presence: true
  validates :slot_id, presence: true
end
