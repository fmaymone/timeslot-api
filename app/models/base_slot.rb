class BaseSlot < ActiveRecord::Base
  include SlotActivity
  include Follow
  include TSErrors

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
                 StdSlotFoaf: 4,
                 GlobalSlot: 15,
                 # remove the following if not needed by factory girl anymore
                 BaseSlot: 0,
                 StdSlot: 20
               }.freeze

  enum slot_type: SLOT_TYPES

  after_commit AuditLog
  after_initialize :set_slot_type, if: :new_record?

  scope :active, -> { where deleted_at: nil }
  # there are additonal scopes defined as class method (upcoming, past)
  # there is also a default scope defined as class method

  # only god knows why, but this must be first, otherwise ActiveRecord screws up
  belongs_to :meta_slot, inverse_of: :slots, autosave: true

  has_many :media_items, -> { where deleted_at: nil }, as: :mediable
  has_many :notes, -> { where deleted_at: nil }, inverse_of: :slot
  has_many :likes, -> { where deleted_at: nil }, inverse_of: :slot
  has_many :comments, -> { where deleted_at: nil }, foreign_key: :slot_id,
           inverse_of: :slot

  has_many :containerships, foreign_key: :slot_id, inverse_of: :slot
  has_many :slot_groups, -> { merge Containership.active },
           through: :containerships, source: :group,
           inverse_of: :slots

  has_many :passengerships, foreign_key: :slot_id, inverse_of: :slot
  has_many :my_calendar_users, -> { merge Passengership.in_schedule },
           through: :passengerships, source: :user,
           inverse_of: :my_calendar_slots

  has_many :tagged_users, -> { merge Passengership.add_media_permitted },
           through: :passengerships, source: :user

  delegate :title, :start_date, :end_date, :creator_id, :creator, :location_uid,
           :location, :ios_location_id, :ios_location, :open_end,
           :title=, :start_date=, :end_date=, :creator=, :location_uid=, :open_end=,
           to: :meta_slot

  validates :meta_slot, presence: true
  # validates :slot_uuid, presence: true # let the db take care of it for now
  validate :type_and_slot_type_in_sync

  # custom validations

  private def type_and_slot_type_in_sync
    # because atm to different mechanism are used for inheritance
    # (custom via 'slot_type' and rails STI via 'type' column),
    # it should be ensured that they hold the same information
    errors.add(:slot_type, "out-of-sync") unless type == slot_type
  end
  # getter

  def visibility
    slot_type.constantize.try(:visibility)
  end

  def visible_count
    CounterService.new.number_of_users_who_can_view_the_slot(self).to_s
  end

  def images
    media_items.image.order(:position)
  end

  def audios
    media_items.audio.order(:position)
  end

  def videos
    media_items.video.order(:position)
  end

  def likes_with_details
    likes.includes([:user])
  end

  def comments_with_details
    comments.includes([:user])
  end

  def as_paging_cursor
    # make sure we use the full resolution of datetime
    startdate = start_date.strftime('%Y-%m-%d %H:%M:%S.%N')
    enddate = end_date.strftime('%Y-%m-%d %H:%M:%S.%N')
    Base64.urlsafe_encode64("#{id}%#{startdate}%#{enddate}")
  end

  # setter

  def ios_location=(location)
    if location[:latitude].present? && location[:longitude].present?
      new_location = IosLocation.find_by(
        latitude: location[:latitude], longitude: location[:longitude])
    end

    update_notification = new_location.present?
    new_location ||= IosLocation.create(location.merge(creator: creator))

    #update custom label for location (same geo-location can have several names)
    new_location[:name] = location[:name] unless location[:name].blank?
    meta_slot.update(ios_location: new_location)

    create_activity('location') if update_notification
    Feed.update_objects(self)
  end

  def update_from_params(meta: nil, media: nil, notes: nil, alerts: nil, user: nil)
    # check if an update notification has to be send
    update_notification = meta ? meta[:start_date] != start_date : false

    # statement order is important, otherwise added errors may be overwritten
    update(meta) if meta
    update_media(media, user.id) if media
    update_notes(notes, user.id) if notes
    user.update_alerts(self, alerts) if alerts

    create_activity('start') if update_notification
    Feed.update_objects(self)
  end

  def add_media(item, creator_id)
    item[:position] = media_items.size unless item.key? "position"
    item[:mediable_id] = id
    item[:mediable_type] = BaseSlot
    item[:creator_id] = creator_id

    new_media = MediaItem.new(item)
    unless new_media.valid?
      errors.add(new_media.media_type, new_media.errors) && return
    end

    # update position of following media items
    if item["position"].to_i < media_items.size
      coll = media_items.includes(:creator).where(
        "media_items.position >= ?", item["position"]).to_a
      coll.each do |coll_item|
        coll_item.update(position: coll_item.position += 1)
      end
    end

    media_items << new_media
    new_media.save
    new_media.create_activity
  end

  def update_notes(new_notes, creator_id)
    new_notes.each do |note|
      if note.key? :id
        notes.find(note[:id]).update(note.permit(:title, :content)
                         .merge!(creator_id: creator_id))
      else
        notes.create(note.merge!(creator_id: creator_id)).create_activity
      end
    end
  end

  def create_like(user)
    like = Like.find_by(slot: self, user: user)
    unless like
      like = likes.create(user: user)
      like.create_activity
    end
    like
  rescue ActiveRecord::RecordNotUnique
    # this is raised when the like is already present, not catching it here
    # means it would be rescued in application_controller.rb and returns 422
    # which is not our intention
  else
    if like.deleted_at? # relike after unlike
      like.update(deleted_at: nil)
      BaseSlot.increment_counter(:likes_count, id)
      like.create_activity
    end
    like
  end

  def destroy_like(user)
    like = likes.find_by(user: user)
    like.try(:delete)
  end

  def create_comment(user, content)
    new_comment = comments.create(user: user, content: content)

    if new_comment.valid?
      new_comment.create_activity
    else
      errors.add(:comment, new_comment.errors)
    end
    new_comment
  end

  def delete
    likes.each(&:delete)
    comments.each(&:delete)
    notes.each(&:delete)
    media_items.each(&:delete)
    containerships.each(&:delete)
    passengerships.each(&:delete)

    remove_all_activities(target: self)

    related_users.each do |user|
      user.prepare_for_slot_deletion self
    end

    prepare_for_deletion
    ts_soft_delete
    meta_slot.unregister

    # Forward deletion activity after 'deleted_at' was set:
    forward_deletion
    # NOTE: Remove follower relations at least!
    remove_all_followers
  end

  ## private instance methods ##

  private def set_slot_type
    self.slot_type ||= self.class.to_s.to_sym
  end

  private def update_media(items, creator_id)
    # check if existing media items, if yes, assume reordering
    if items.first.key? :media_id
      unless MediaItem.reorder_media items
        errors.add(:media_items, 'invalid ordering')
      end
    else
      add_media_items(items, creator_id)
    end
  end

  private def add_media_items(items, creator_id)
    items.each do |item_hash|
      item = ActionController::Parameters.new(item_hash)
      case item[:media_type]
      when 'image'
        add_media(item.permit(:public_id, :position, :local_id)
          .merge(media_type: 'image'), creator_id)
      when 'audio'
        add_media(
          item.permit(:public_id, :position, :local_id, :duration, :title)
          .merge(media_type: 'audio'), creator_id)
      when 'video'
        add_media(
          item.permit(:public_id, :position, :local_id, :duration, :thumbnail)
          .merge(media_type: 'video'), creator_id)
      end
    end
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
    # apply default scope only to the 'leaves'
    where(slot_type: SLOT_TYPES[to_s.to_sym]) if subclasses.empty?
  end

  def self.get(slot_id)
    # reloading necessary to get attributes from MTI tables
    BaseSlot.find(slot_id).reload
  end

  # TODO: add spec
  def self.upcoming
    # BaseSlot.includes(:meta_slot).
      # where('meta_slots.start_date > ?', Time.zone.now).references(:meta_slot)
    joins(:meta_slot).where('meta_slots.start_date > ?', Time.zone.now)
  end

  def self.past
    joins(:meta_slot).where('meta_slots.start_date < ?', Time.zone.now)
  end

  def self.next
    upcoming.order('meta_slots.start_date').first
  end

  def self.create_slot(meta:, visibility: nil, group: nil, media: nil,
                       notes: nil, alerts: nil, user: nil)
    fail unless visibility

    meta_slot = MetaSlot.find_or_add(meta.merge(creator: user))
    # TODO: fail instead of return here, fail in the find_or_add method
    return meta_slot unless meta_slot.errors.empty?

    slot = StdSlot.create_slot(meta_slot: meta_slot,
                               visibility: visibility,
                               user: user)

    # TODO: fail instead of return here or even better, fail in the create_slot
    return slot unless slot.errors.empty?

    #slot.create_activity

    if media || notes || alerts
      slot.update_from_params(media: media, notes: notes, alerts: alerts,
                              user: user)
    end

    slot
  end

  # takes an encoded_slot string and returns the matching slot
  # see: BaseSlot.as_paging_cursor
  # raises PaginationError if invalid cursor_string
  def self.from_paging_cursor(encoded_cursor_string)
    decoded_cursor_string = Base64.urlsafe_decode64(encoded_cursor_string)
  rescue ArgumentError
    raise ApplicationController::PaginationError
  else
    # check for validity
    begin
      cursor_array = decoded_cursor_string.split('%')
      cursor = { id: cursor_array.first.to_i,
                startdate: cursor_array.second,
                enddate: cursor_array.third }
      slot = get(cursor[:id])
    rescue ActiveRecord::RecordNotFound
      raise PaginationError, "invalid pagination cursor"
    # the following is not really necessary, might be removed at some point
    # but for now it gives some useful info about the system
    else
      if slot.start_date.strftime('%Y-%m-%d %H:%M:%S.%N') != cursor[:startdate] ||
         slot.end_date.strftime('%Y-%m-%d %H:%M:%S.%N') != cursor[:enddate]
        opts = { cursor_id: cursor[:id],
                 cursor_startdate: cursor[:startdate],
                 cursor_enddate: cursor[:enddate] }
        Airbrake.notify(ApplicationController::PaginationError, opts)
        fail PaginationError, "cursor slot changed" if Rails.env.development?
      end
      cursor
    end
  end

  # for Pundit
  def self.policy_class
    SlotPolicy
  end

  ## Activity Methods ##

  private def activity_target
    self
  end

  private def activity_actor
    creator
  end

  private def activity_action
    'create'
  end
end
