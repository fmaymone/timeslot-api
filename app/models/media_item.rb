class MediaItem < ActiveRecord::Base
  after_commit AuditLog

  belongs_to :mediable, polymorphic: true
  belongs_to :creator, class_name: User

  scope :image, -> { where media_type: 'image' }
  scope :audio, -> { where media_type: 'audio' }
  scope :video, -> { where media_type: 'video' }

  validates :media_type,
            presence: true,
            inclusion: { in: %w(image audio video) }
  validates :public_id, presence: true
  validates :position, presence: true, if: :belongs_to_slot?
  validates :mediable_id, presence: true
  validates :mediable_type, presence: true
  validates :local_id, length: { maximum: 512 }
  validates :thumbnail, length: { maximum: 255 }
  validates :title, length: { maximum: 64 }
  validates :creator_id, presence: true

  def belongs_to_slot?
    mediable_type == "BaseSlot"
  end

  def delete
    items_with_same_public_id = MediaItem.where(public_id: public_id)
    return if items_with_same_public_id.size > 1

    Cloudinary::Uploader.add_tag("replaced", public_id)
    Cloudinary::Uploader.add_tag(
      "mediable_id:#{mediable.id}, mediable_type:#{mediable_type}", public_id)
  rescue => e
    msg = { image: self }
    msg.merge!(cloudinary: "adding tag for destroyed media_item failed.")
    msg.merge!(error: e)
    Rails.logger.error msg
    Airbrake.notify(msg)
  ensure
    ts_soft_delete
  end

  def self.reorder_media(media_items)
    return false unless self.valid_sorting? media_items

    media_items.each do |item|
      MediaItem.find(item[:media_id]).update(position: item[:position])
    end
    true
  end

  def self.valid_sorting?(parameter)
    arr = parameter.map { |i| i[:position].to_i }
    no_gaps = arr.size > arr.max
    dups = arr.find { |e| arr.rindex(e) != arr.index(e) }
    dups.nil? && no_gaps
  end
end
