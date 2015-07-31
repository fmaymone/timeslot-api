class AddImage
  def self.call(model, public_id, local_id = nil, creator_id)
    media_item = MediaItem.new(public_id: public_id, mediable_id: model.id,
                               media_type: "image", mediable_type: model.class,
                               local_id: local_id, creator_id: creator_id)
    unless media_item.valid?
      model.errors.add(:mediaItem, media_item.errors.messages) && return
    end

    model.image.delete if model.images.first
    model.images << media_item
    media_item.save
  end
end
