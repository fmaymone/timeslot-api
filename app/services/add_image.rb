class AddImage
  def self.call(model, public_id)
    media_item = MediaItem.new(public_id: public_id, media_type: "image")
    unlink_existing_image model if model.image

    begin
      model.image = media_item
    rescue ActiveRecord::RecordNotSaved => e
      model.errors.add(:media_item, e.message)
    end

    image_updated = model.image && (model.image.public_id == public_id)
    image_updated || model
  end

  class << self
    private def unlink_existing_image(model)
      Cloudinary::Uploader.add_tag("replaced", model.image.public_id)
      Cloudinary::Uploader.add_tag("model-id:#{model.id}", model.image.public_id)
    rescue => e
      msg = { image: self }
      msg.merge!(cloudinary: "adding tag for destroyed media_item failed.")
      msg.merge!(error: e)
      Rails.logger.error msg
    ensure
      model.image = nil
    end
  end
end
