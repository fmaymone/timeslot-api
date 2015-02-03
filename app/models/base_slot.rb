class BaseSlot < ActiveRecord::Base
  # this class is not intended to be used directly
  # but rather as an uniform interface for the specific slot representations
  # it shares postgres inheritance semantics at the db level with its subtypes
  class InterfaceNotImplementedError < NoMethodError; end

  after_commit AuditLog
  before_create :unique_slot_id

  scope :active, -> { where deleted_at: nil }

  has_many :media_items, -> { where deleted_at: nil }, as: :mediable
  has_many :notes, -> { where deleted_at: nil }, inverse_of: :slot
  has_many :likes, -> { where deleted_at: nil }, inverse_of: :slot
  belongs_to :meta_slot, inverse_of: :slots, autosave: true

  delegate :title, :start_date, :end_date, :creator, :location_id, :location,
           :title=, :start_date=, :end_date=, :creator=, :location_id=,
           to: :meta_slot

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

  def update_from_params(meta_params, media_params = nil, note_param = nil,
                         alerts_param = nil, user)
    # statement order is important, otherwise added errors may be overwritten
    update(meta_params) if meta_params
    update_media(media_params) if media_params
    update_notes(note_param) if note_param
    user.update_alerts(self, alerts_param) if alerts_param
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
    # Likes
    # Comments
    notes.each(&:delete)
    media_items.each(&:delete)
    related_users.each do |user|
      user.prepare_for_slot_deletion self
    end
    ts_soft_delete
    meta_slot.unregister
  end

  private def update_media(media_params)
    media_map = [:photos, :voices, :videos]

    media_map.each do |media_type|
      next unless media_params[media_type].present?

      items = media_params[media_type].each do |item|
        item.transform_keys!(&:underscore)
      end

      if items.first.key? "media_id"
        unless MediaItem.reorder_media items
          errors.add(:media_items, 'invalid ordering')
        end
      else
        add_media_items(items, media_type)
      end
    end
  end

  ## abstract methods ##

  def related_users
    fail InterfaceNotImplementedError
  end

  ## private methods ##

  private def add_media_items(collection, media_type)
    case media_type
    when :photos
      add_photos(collection)
    when :voices
      add_voices(collection)
    when :videos
      add_videos(collection)
    end
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

  def self.slot_map
    { 'BaseSlot' => '10',
      'StdSlot' => '11',
      'GroupSlot' => '12',
      'ReSlot' => '13' }
  end

  def self.get(slot_id)
    class_name = slot_map.invert[slot_id.to_s[0, 2]]
    fail ActiveRecord::RecordNotFound if class_name.nil?
    class_name.constantize.find(slot_id)
  end

  def self.get_many(slot_ids)
    slot_ids.collect { |id| get(id) }
  end

  # for Pundit
  def self.policy_class
    SlotPolicy
  end
end
