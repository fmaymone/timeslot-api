class MediaItem < ActiveRecord::Base
  belongs_to :mediable, polymorphic: true

  validates :media_type,
            presence: true,
            inclusion: { in: %w(image voice video) }
  validates :public_id, presence: true
  validates :ordering, presence: true, if: :belongs_to_meta_slot?
  validates :mediable_id, presence: true
  validates :mediable_type, presence: true

  def belongs_to_meta_slot?
    mediable_type == "MetaSlot"
  end

  def self.reorder?(order_params)
    return false unless self.valid_ordering? order_params

    # TODO: might need to validate new media item before reordering
    order_params.each do |item|
      changed = MediaItem.where(id: item[:media_item_id])
                .update_all(ordering: item[:ordering])
      fail ActiveRecord::RecordNotFound if changed == 0
    end
    true
  end

  def self.valid_ordering?(parameter)
    arr = parameter.map { |i| i[:ordering].to_i }
    no_gaps = arr.size > arr.max
    dups = arr.find { |e| arr.rindex(e) != arr.index(e) }
    dups.nil? && no_gaps
  end

  def self.insert(collection, new_media)
    if !new_media.key? :ordering
      new_media.merge!(ordering: collection.size)
    elsif new_media.require(:ordering).to_i < collection.size
      needs_ordering_update(collection, new_media.require(:ordering))
    end

    MediaItem.new(new_media)
  end

  def self.needs_ordering_update(collection, ordering_param)
    media_items = collection.where(
      "media_items.ordering >= ?", ordering_param).to_a

    media_items.each do |item|
      item.update(ordering: item.ordering += 1)
    end
  end
end
