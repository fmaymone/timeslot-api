class MediaItem < ActiveRecord::Base
  include SlotActivity

  after_commit AuditLog

  belongs_to :mediable, polymorphic: true
  belongs_to :creator, class_name: User

  scope :image, -> { where media_type: 'image' }
  scope :audio, -> { where media_type: 'audio' }
  scope :video, -> { where media_type: 'video' }

  validates :media_type, presence: true,
            inclusion: { in: %w(image audio video) }
  validates :public_id, presence: true
  validates :position, presence: true, if: :belongs_to_slot?
  validates :mediable_id, presence: true
  validates :mediable_type, presence: true
  validates :local_id, length: { maximum: 512 }
  validates :thumbnail, length: { maximum: 255 }
  validates :title, length: { maximum: 64 }
  validates :creator, presence: true

  def belongs_to_slot?
    mediable_type == "BaseSlot"
  end

  def delete
    items_with_same_public_id = MediaItem.where(public_id: public_id)
    return if items_with_same_public_id.size > 1

    Cloudinary::Uploader.add_tag("replaced", public_id)
    Cloudinary::Uploader.add_tag(
      "mediable_id:#{mediable.id}, mediable_type:#{mediable_type}", public_id)

    if position == 0 && mediable.images.count > 1
      last_item = mediable.media_items.sort_by(&:position).last
      last_image = mediable.images.sort_by(&:position).last
      old_position = last_image.position
      last_image.update(position: 0)
      last_item.update(position: old_position) if last_item != last_image
    end

    self.update(position: -1)

  rescue CloudinaryException => e
    msg = { image: self }
    msg[:cloudinary] = "adding tag for destroyed media_item failed."
    msg[:error] = e
    Rails.logger.error { msg }
    Airbrake.notify(e, parameters: msg)
  ensure
    remove_activity
    ts_soft_delete
  end

  def self.reorder_media(media_items)
    return false unless self.valid_sorting? media_items

    media_items.each do |item|
      media_item = MediaItem.find(item[:media_id])
      next unless media_item
      if item[:position] != media_item[:position]
        replace_media = media_item.mediable.media_items.find_by(position: item[:position])
        replace_media.update(position: media_item[:position]) if replace_media
        media_item.update(position: item[:position])
      end
    end
    true
  end

  def self.valid_sorting?(parameter)
    arr = parameter.map { |i| i[:position].to_i }
    no_gaps = arr.size > arr.max
    dups = arr.find { |e| arr.rindex(e) != arr.index(e) }
    dups.nil? && no_gaps
  end

  ## Activity Methods ##

  private def activity_is_valid?(action)
    super and belongs_to_slot?
  end

  private def activity_target
    mediable
  end

  # The user who made the update
  private def activity_actor
    creator
  end

  private def activity_action
    media_type
  end
end
