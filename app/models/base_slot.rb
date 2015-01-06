class BaseSlot < ActiveRecord::Base
  # this class is not intended to be used directly
  # but rather as an uniform interface for the specific slot representations
  # it shares postgres inheritance semantics at the db level with its subtypes
  after_commit AuditLog
  before_create :unique_slot_id

  scope :active, -> { where deleted_at: nil }

  has_many :media_items, -> { where deleted_at: nil }, as: :mediable
  has_many :notes, -> { where deleted_at: nil }, inverse_of: :base_slot
  belongs_to :meta_slot

  delegate :title, :start_date, :end_date, :creator, :location_id, to: :meta_slot

  validates :meta_slot, presence: true

  def photos
    media_items.image.order(:ordering)
  end

  def voices
    media_items.voice.order(:ordering)
  end

  def videos
    media_items.video.order(:ordering)
  end

  def location
    Location.find(location_id)
  end

  def alerts(user)
    setting = SlotSetting.where(user: user, meta_slot: meta_slot)
    setting.first.alerts if setting.exists?
  end

  def add_media(item)
    new_item = MediaItem.insert(media_items, item)
    media_items << new_item
    errors.add(new_item.media_type, new_item.errors.messages) unless save
  end

  def add_photos(items)
    items.each do |item|
      item = item.permit(:publicId, :ordering).merge(mediaType: 'image')
      add_media(item.transform_keys(&:underscore))
    end
  end

  def add_voices(items)
    items.each do |item|
      item = item.permit(:publicId, :ordering, :duration)
             .merge(mediaType: 'voice')
      add_media(item.transform_keys(&:underscore))
    end
  end

  def add_videos(items)
    items.each do |item|
      item = item.permit(:publicId, :ordering, :duration, :thumbnail)
             .merge(mediaType: 'video')
      add_media(item.transform_keys(&:underscore))
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
