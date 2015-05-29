class BaseSlot < ActiveRecord::Base
  # this class is not intended to be used directly
  # but rather as an uniform interface for the specific slot representations
  # it shares postgres inheritance semantics at the db level with its subtypes
  class InterfaceNotImplementedError < NoMethodError; end

  # If a new SlotType is added to the app, it also needs to be added here
  # I tried to solve this by meta programming but it's not worth the effort
  # and I want to be sure the same integers are used for the same slot type
  # Using the classnames as constants is not so pretty but I don't know about
  # a real downside yet and it saves an additional conversion to snake_case
  SLOT_TYPES = { StdSlotPrivate: 1,
                 StdSlotFriends: 2,
                 StdSlotPublic: 3,
                 GroupSlotMembers: 4,
                 GroupSlotPublic: 5,
                 ReSlotFriends: 6,
                 ReSlotPublic: 7,
                 # mabye remove the following
                 BaseSlot: 0,
                 StdSlot: 20,
                 GroupSlot: 21,
                 ReSlot: 22,
               }

  enum slot_type: SLOT_TYPES

  after_commit AuditLog
  after_initialize :set_slot_type, if: :new_record?

  scope :active, -> { where deleted_at: nil }
  # there is also a default scope defined as class method

  has_many :media_items, -> { where deleted_at: nil }, as: :mediable
  has_many :notes, -> { where deleted_at: nil }, inverse_of: :slot
  has_many :likes, inverse_of: :slot
  has_many :comments, -> { where deleted_at: nil }, foreign_key: "slot_id",
           inverse_of: :slot
  belongs_to :meta_slot, inverse_of: :slots, autosave: true
  belongs_to :shared_by, class_name: User

  delegate :title, :start_date, :end_date, :creator, :location_id, :location,
           :ios_location_id, :ios_location, :open_end,
           :title=, :start_date=, :end_date=, :creator=, :location_id=, :ios_location=,
           to: :meta_slot

  validates :meta_slot, presence: true

  def visibility
    slot_type.constantize.try(:visibility)
  end

  def photos
    media_items.image.order(:position)
  end

  def voices
    media_items.voice.order(:position)
  end

  def videos
    media_items.video.order(:position)
  end

  def update_from_params(meta: nil, media: nil, notes: nil, alerts: nil, user: nil)
    # statement order is important, otherwise added errors may be overwritten
    update(meta) if meta
    update_media(media) if media
    update_notes(notes) if notes
    user.update_alerts(self, alerts) if alerts
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

  def create_like(user)
    like = likes.find_by(user: user) || likes.create(user: user)
    like.update(deleted_at: nil) if like.deleted_at? # relike after unlike
  end

  def destroy_like(user)
    like = likes.find_by(user: user)
    like.try(:delete)
  end

  def likes_with_details
    likes.includes([:user])
  end

  def create_comment(user, content)
    new_comment = comments.create(user: user, content: content)
    return new_comment if new_comment.valid?
    errors.add(:comment, new_comment.errors)
  end

  def comments_with_details
    comments.includes([:user])
  end

  def set_share_id(user)
    self.share_id? || create_share_id(user)
  end

  def delete
    likes.each(&:delete)
    comments.each(&:delete)
    notes.each(&:delete)
    media_items.each(&:delete)
    related_users.each do |user|
      user.prepare_for_slot_deletion self
    end
    prepare_for_deletion
    ts_soft_delete
    meta_slot.unregister
  end

  def copy_to(targets, user)
    targets.each do |target|
      BaseSlot.duplicate_slot(self, target, user)
    end
  end

  def move_to(target, user)
    new_slot = BaseSlot.duplicate_slot(self, target, user)
    delete if new_slot.errors.empty?
    new_slot
  end

  ## private instance methods ##

  private def set_slot_type
    self.slot_type ||= self.class.to_s.to_sym
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

  private def create_share_id(user)
    new_share_id = ''
    loop do
      # length of the result string is about 4/3 of the argument, now: 8 chars
      new_share_id = SecureRandom.urlsafe_base64(6).tr('-_lIO0', 'xzpstu')
      break unless self.class.exists?(share_id: new_share_id)
    end
    update(share_id: new_share_id)
    update(shared_by: user)
  end

  ## abstract methods ##

  def related_users
    fail InterfaceNotImplementedError
  end

  def prepare_for_deletion
    fail InterfaceNotImplementedError
  end

  ## class methods ##

  def self.default_scope
    where(slot_type: SLOT_TYPES[to_s.to_sym]) unless self == BaseSlot
  end

  def self.get(slot_id)
    bs = BaseSlot.find(slot_id)
    bs.slot_type.constantize.find(slot_id)
  end

  def self.get_many(slot_ids)
    slot_ids.collect { |id| get(id) }
  end

  # TODO: add spec, check performance
  def self.upcoming
    # BaseSlot.includes(:meta_slot).
      # where('meta_slots.start_date > ?', Time.zone.now).references(:meta_slot)
    joins(:meta_slot).where('meta_slots.start_date > ?', Time.zone.now)
  end

  def self.next
    upcoming.order('meta_slots.start_date').first
  end

  def self.create_slot(meta:, visibility: nil, group: nil, media: nil,
                       notes: nil, alerts: nil, user: nil)

    # TODO: improve
    fail unless visibility || group

    meta_slot = MetaSlot.find_or_add(meta.merge(creator: user))
    return meta_slot unless meta_slot.errors.empty?

    if visibility
      slot = StdSlot.create_slot(meta_slot: meta_slot, visibility: visibility,
                                 user: user)
    elsif group
      slot = GroupSlot.create_slot(meta_slot: meta_slot, group: group)
    end

    return slot unless slot.errors.empty?

    if (media || notes || alerts)
      slot.update_from_params(media: media, notes: notes, alerts: alerts,
                              user: user)
    end

    slot
  end

  def self.duplicate_slot(source, target, user)
    visibility = target[:slot_type] if target[:slot_type]
    group = Group.find(target[:group_id]) if target[:group_id]
    details = target[:details]
    # YAML.load converts to boolean
    with_details = details.present? ? YAML.load(details.to_s) : true

    duplicated_slot = create_slot(meta: { meta_slot_id: source.meta_slot_id },
                                  visibility: visibility,
                                  group: group,
                                  user: user)

    duplicate_slot_details(source, duplicated_slot) if with_details
    duplicated_slot
  end

  def self.duplicate_slot_details(old_slot, new_slot)
    old_slot.media_items.reverse_each do |item|
      attr = item.attributes
      attr.delete('id')
      new_slot.media_items.create(attr)
    end

    old_slot.notes.each do |note|
      new_slot.notes.create(title: note.title, content: note.content)
    end
  end

  # for Pundit
  def self.policy_class
    SlotPolicy
  end
end
