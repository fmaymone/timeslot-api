class BaseSlot < ActiveRecord::Base
  # this class is not intended to be used directly
  # but rather as an uniform interface for the specific slot representations
  # it shares postgres inheritance semantics at the db level with its subtypes
  after_commit AuditLog
  before_create :unique_slot_id

  scope :active, -> { where deleted_at: nil }

  has_many :media_items, -> { where deleted_at: nil }, as: :mediable
  has_many :notes, -> { where deleted_at: nil }, inverse_of: :base_slot
  belongs_to :meta_slot, autosave: true

  delegate :title, :title=, :start_date, :start_date=, :end_date, :end_date=,
           :creator, :creator=, :location_id, :location_id=, to: :meta_slot

  validates :meta_slot, presence: true

  def photos
    media_items.image.order(:position)
  end

  def voices
    media_items.voice.order(:position)
  end

  def videos
    media_items.video.order(:position)
  end

  def location
    Location.find(location_id)
  end

  def alerts(user)
    setting = SlotSetting.where(user: user, meta_slot: meta_slot)
    setting.first.alerts if setting.exists?
  end

  def add_media(item)
    item.merge!(position: media_items.size) unless item.key? "position"
    item.merge!(mediable_id: id, mediable_type: BaseSlot)

    new_media = MediaItem.new(item)
    unless new_media.valid?
      errors.add(new_media.media_type, new_media.errors) && return
    end

    # update position of following media items
    if item["position"].to_i < media_items.size
      coll = media_items.where(
        "media_items.position >= ?", item["position"]).to_a
      coll.each do |coll_item|
        coll_item.update(position: coll_item.position += 1)
      end
    end

    media_items << new_media
    new_media.save
  end

  def add_media_items(collection, media_type)
    case media_type
    when :photos
      add_photos(collection)
    when :voices
      add_voices(collection)
    when :videos
      add_videos(collection)
    end
  end

  def update_notes(new_notes)
    new_notes.each do |note|
      if note.key? 'id'
        notes.find(note["id"]).update(note.permit(:title, :content))
      else
        notes.create(note.permit(:title, :content))
      end
    end
  end

  def delete
    # -> make an "unregister" Method in SlotSetting Class so it can take care itself

    # delete SlotSetting object if one exists and it is only referenced by
    # this reslot or softdeleted slots
    # TODO: add helper within user model to get slot_setting references
    # condition = { meta_slot: self.meta_slot.id }

    # if current_user.slot_settings.where(condition).exists?
    #   unless current_user.std_slots.active.where(condition).exists? ||
    #          current_user.group_slots.active.where(condition).exists?
    #     SoftDelete.call(current_user.slot_settings.where(condition).first)
    #   end
    # end

    # alarm/slot_setting
    # Notes
    # Likes
    # Comments
    # meta_slot.unregister
    media_items.each(&:delete)
    SoftDelete.call(self)
  end

  private def unique_slot_id
    identifier = self.class.slot_map[self.class.model_name.name]
    slot_id_string = identifier + self.class.count.to_s
    self.id = slot_id_string.to_i
  end

  private def add_photos(items)
    items.each do |item|
      add_media(item.permit(:public_id, :position).merge(media_type: 'image'))
    end
  end

  private def add_voices(items)
    items.each do |item|
      add_media(item.permit(:public_id, :position, :duration)
                 .merge(media_type: 'voice'))
    end
  end

  private def add_videos(items)
    items.each do |item|
      add_media(item.permit(:public_id, :position, :duration, :thumbnail)
                 .merge(media_type: 'video'))
    end
  end

  class << self
    def slot_map
      { 'BaseSlot' => '10',
        'StdSlot' => '11',
        'GroupSlot' => '12',
        'ReSlot' => '13' }
    end

    def get(slot_id)
      class_name = slot_map.invert[slot_id.to_s[0, 2]]
      fail ActiveRecord::RecordNotFound if class_name.nil?
      class_name.constantize.find(slot_id)
    end

    def get_many(slot_ids)
      slot_ids.collect { |id| get(id) }
    end
  end
end
