class BaseSlot < ActiveRecord::Base
  include SlotActivity
  include Follow
  include TS_Errors

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
                 ReSlotFriends: 6,
                 ReSlotPublic: 7,
                 GroupSlotMembers: 11,
                 GroupSlotPublic: 12,
                 # remove the following if not needed by factory girl anymore
                 BaseSlot: 0,
                 StdSlot: 20,
                 ReSlot: 22,
                 GroupSlot: 21
               }

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
  has_many :re_slots, class_name: ReSlot, foreign_key: :parent_id
  belongs_to :shared_by, class_name: User

  delegate :title, :start_date, :end_date, :creator_id, :creator, :location_id,
           :location, :ios_location_id, :ios_location, :open_end,
           :title=, :start_date=, :end_date=, :creator=, :location_id=, :open_end=,
           to: :meta_slot

  validates :meta_slot, presence: true

  # getter

  def visibility
    slot_type.constantize.try(:visibility)
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

    new_location ||= IosLocation.create(location.merge(creator: owner))

    #update custom label for location (same geo-location can have several names)
    new_location[:name] = location[:name] unless location[:name].blank?
    meta_slot.update(ios_location: new_location)
  end

  def update_from_params(meta: nil, media: nil, notes: nil, alerts: nil, user: nil)
    # statement order is important, otherwise added errors may be overwritten
    update(meta) if meta
    update_media(media, user.id) if media
    update_notes(notes, user.id) if notes
    user.update_alerts(self, alerts) if alerts
  end

  def add_media(item, creator_id)
    item.merge!(position: media_items.size) unless item.key? "position"
    item.merge!(mediable_id: id, mediable_type: BaseSlot,
                creator_id: creator_id)

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

  def update_notes(new_notes, creator_id)
    new_notes.each do |note|
      if note.key? :id
        notes.find(note[:id]).update(note.permit(:title, :content)
                         .merge!(creator_id: creator_id))
      else
        notes.create(note.permit(:title, :content, :local_id)
                         .merge!(creator_id: creator_id))
      end
    end
  end

  def create_like(user)
    if self.class <= ReSlot
      like = Like.find_by(slot: parent, user: user)
    else
      like = Like.find_by(slot: self, user: user)
    end
    like ||= likes.create(user: user)
  rescue ActiveRecord::RecordNotUnique
    # this is raised when the like is already present, not catching it here
    # means it would be rescued in application_controller.rb and returns 422
    # which is not our intention
  else
    like.update(deleted_at: nil) if like.deleted_at? # relike after unlike

    message_content = I18n.t('slot_like_push_singular',
                             USER: user.username,
                             TITLE: meta_slot.title)

    Device.notify_all([creator_id], [message: message_content,
                                     slot_id: self.id])
  end

  def destroy_like(user)
    like = likes.find_by(user: user)
    like.try(:delete)
  end

  def create_comment(user, content)
    new_comment = comments.create(user: user, content: content)
    errors.add(:comment, new_comment.errors) unless new_comment.valid?

    # Is the creator really what we want?
    # For std_slots we want the owner. For Groupslots?
    user_ids = [creator_id]
    user_ids += comments.pluck(:user_id)
    user_ids += likes.pluck(:user_id)
    # remove the user who did the actual comment
    user_ids.delete(user.id)

    message_content = I18n.t('slot_comment_push_singular',
                             USER: user.username,
                             TITLE: meta_slot.title)

    Device.notify_all(user_ids.uniq, [message: message_content,
                                      slot_id: new_comment.slot_id])
    new_comment
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
    remove_all_followers
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
    # apply default scope only to the 'leaves'
    where(slot_type: SLOT_TYPES[to_s.to_sym]) if subclasses.empty?
  end

  def self.get(slot_id)
    bs = BaseSlot.find(slot_id)
    bs.slot_type.constantize.find(slot_id)
  end

  def self.get_many(slot_ids)
    slot_ids.collect { |id| get(id) }
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

    if media || notes || alerts
      slot.update_from_params(media: media, notes: notes, alerts: alerts,
                              user: user)
    end

    slot
  end

  def self.duplicate_slot(source, target, current_user)
    visibility = target[:slot_type] if target[:slot_type]
    group = Group.find(target[:group_id]) if target[:group_id]
    details = target[:details]
    # YAML.load converts to boolean
    with_details = details.present? ? YAML.load(details.to_s) : true

    duplicated_slot = create_slot(meta: { meta_slot_id: source.meta_slot_id },
                                  visibility: visibility,
                                  group: group,
                                  user: current_user)

    duplicate_slot_details(source, duplicated_slot, current_user) if with_details
    duplicated_slot
  end

  def self.duplicate_slot_details(old_slot, new_slot, user)
    old_slot.media_items.reverse_each do |item|
      attr = item.attributes
      attr.delete('id')
      new_slot.media_items.create(attr)
    end

    old_slot.notes.each do |note|
      new_slot.notes.create(title: note.title,
                            content: note.content,
                            creator: user) # user => current_user
    end
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
      cursor = {id: cursor_array.first.to_i,
                startdate: cursor_array.second,
                enddate: cursor_array.third}
      slot = get(cursor[:id])
    rescue ActiveRecord::RecordNotFound
      raise PaginationError, "invalid pagination cursor"
    # the following is not really neccessary, might be removed at some point
    # but for now it gives some useful info about the system
    else
      if slot.start_date.strftime('%Y-%m-%d %H:%M:%S.%N') != cursor[:startdate] ||
         slot.end_date.strftime('%Y-%m-%d %H:%M:%S.%N') != cursor[:enddate]
        opts = {}
        opts[:parameters] = { cursor_id: cursor[:id],
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

  private def activity_verb
    'slot'
  end

  private def activity_foreign
    nil
  end
end
