class MediaItem < ActiveRecord::Base
  after_commit AuditLog

  belongs_to :mediable, polymorphic: true

  scope :image, -> { where media_type: 'image' }
  scope :voice, -> { where media_type: 'voice' }
  scope :video, -> { where media_type: 'video' }

  validates :media_type,
            presence: true,
            inclusion: { in: %w(image voice video) }
  validates :public_id, presence: true
  validates :position, presence: true, if: :belongs_to_slot?
  validates :mediable_id, presence: true
  validates :mediable_type, presence: true

  def belongs_to_slot?
    mediable_type == "BaseSlot"
  end

  def delete
    Cloudinary::Uploader.add_tag("replaced", public_id)
    Cloudinary::Uploader.add_tag(
      "mediable_id:#{mediable.id}, mediable_type:#{mediable_type}", public_id)
  rescue => e
    msg = { image: self }
    msg.merge!(cloudinary: "adding tag for destroyed media_item failed.")
    msg.merge!(error: e)
    Rails.logger.error msg
  ensure
    SoftDelete.call(self)
  end

  class << self
    def reorder?(order_params)
      return false unless self.valid_ordering? order_params

      # TODO: might need to validate new media item before reordering
      order_params.each do |item|
        changed = MediaItem.where(id: item[:mediaItemId])
                  .update_all(position: item[:position])
        fail ActiveRecord::RecordNotFound if changed == 0
      end
      true
    end

    def valid_ordering?(parameter)
      arr = parameter.map { |i| i[:position].to_i }
      no_gaps = arr.size > arr.max
      dups = arr.find { |e| arr.rindex(e) != arr.index(e) }
      dups.nil? && no_gaps
    end

    def insert(collection, new_media)
      if !new_media.key? "position"
        new_media.merge!(position: collection.size)
      elsif new_media["position"].to_i < collection.size
        needs_ordering_update(collection, new_media["position"])
      end

      MediaItem.new(new_media)
    end

    def needs_ordering_update(collection, position_param)
      media_items = collection.where(
        "media_items.position >= ?", position_param).to_a

      media_items.each do |item|
        item.update(position: item.position += 1)
      end
    end
  end
end
