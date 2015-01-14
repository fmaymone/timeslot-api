class AddImage
  def self.call(model, public_id)
    media_item = MediaItem.new(public_id: public_id, mediable_id: model.id,
                               media_type: "image", mediable_type: model.class)
    unless media_item.valid?
      model.errors.add(:mediaItem, media_item.errors.messages) && return
    end

    model.image.first.delete if model.image.first
    model.image << media_item
    media_item.save
  end
end
