class AddImage
  # TODO: use custom class as return value to simplify error handling
  def self.call(model, public_id)
    media_item = MediaItem.new(public_id: public_id, media_type: "image")
    model.image.first.delete if model.image.first

    begin
      model.image << media_item
    rescue ActiveRecord::RecordNotSaved => e
      model.errors.add(:media_item, e.message)
    end

    image_updated = model.image.first && (model.image.first.public_id == public_id)
    image_updated || model
  end
end
