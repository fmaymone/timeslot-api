class MediaItem < ActiveRecord::Base
  belongs_to :mediable, polymorphic: true

  validates :media_type, presence: true # , length: { maximum: 12 }
  validates :public_id, presence: true
  validates :ordering, presence: true
  validates :mediable_id, presence: true
  validates :mediable_type, presence: true
end
