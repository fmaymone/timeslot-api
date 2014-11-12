class AddImage
  def self.call(model, public_id)
    media_item = MediaItem.new(public_id: public_id, media_type: "image")
    begin
      model.image = media_item
    rescue ActiveRecord::RecordNotSaved => e
      model.errors.add(:media_item, e.message)
    end
    image_updated = model.image && (model.image.public_id == public_id)
    image_updated || model
  end
end
