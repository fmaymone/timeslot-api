class ReSlot < BaseSlot
  self.table_name = model_name.plural

  class ReslotHistroyError < StandardError; end

  # mapping the frontend string to the class
  RE_SLOT_TYPES = { 'private' => :ReSlotPrivate,
                    'friends' => :ReSlotFriends,
                    'foaf' => :ReSlotFoaf,
                    'public' => :ReSlotPublic
                  }

  scope :unprivate, -> { where.not(slot_type: SLOT_TYPES[:ReSlotPrivate]) }

  belongs_to :slotter, class_name: User, inverse_of: :re_slots
  belongs_to :predecessor, class_name: BaseSlot
  belongs_to :parent, class_name: BaseSlot, counter_cache: true
  # atm parents are always StdSlot but later they might be eg. public groupslots
  # because of that I used BaseSlot as the associaton type

  delegate :media_items, :notes, :likes, :comments, :images, :audios, :videos,
           :re_slots, :comments_count, :likes_count, :re_slots_count,
           :media_items=, :notes=, :likes=, :comments=, :images=, :audios=, :videos=,
           to: :parent

  validate :parent_visibility_not_exceeded
  validates :slotter, presence: true
  validates :predecessor, presence: true
  validates :parent, presence: true

  def source
    BaseSlot.get(parent.id)
  end

  def chronic
    predecessors = []
    slot = self

    loop do
      slot = BaseSlot.get(slot.predecessor.id)
      if slot.deleted_at?
        Airbrake.notify(ReslotHistoryError,
                        error_message: "found deleted predecessor: #{slot}")
      end
      predecessors << slot
      break if slot.predecessor == slot.parent
    end

    predecessors
  end

  def muid
    source.try(:muid)
  end

  def related_users
    [slotter]
  end

  def prepare_for_deletion
    update_successors
  end

  def delete
    remove_all_activities(target: self) # 'unslot'
    remove_all_followers
    slotter.unfollow(predecessor)
    slotter.prepare_for_slot_deletion self
    prepare_for_deletion
    BaseSlot.decrement_counter(:re_slots_count, parent_id)
    ts_soft_delete
  end

  private def update_successors
    successors = ReSlot.where(predecessor: self)
    successors.each do |slot|
      slot.update(predecessor: predecessor)
    end
  end

  private def parent_visibility_not_exceeded
    return unless parent
    if (parent.visibility != 'public' && visibility == 'public') ||
       (parent.visibility == 'friends' && visibility == 'foaf')
      errors.add(:visibility,
                 "can't exceed parent visibility ('#{parent.visibility}')")
    end
  end

  def reuse_existing(predecessor, slottype)
    # update visibility if different than the original reslot
    update(slot_type: SLOT_TYPES[slottype.to_sym]) unless slot_type == slottype

    return unless deleted_at?

    update(deleted_at: nil, predecessor: predecessor)
    BaseSlot.increment_counter(:re_slots_count, parent_id)
    create_activity
  end

  def self.create_from_slot(predecessor:, slotter:, visibility: nil)
    parent = predecessor.class <= ReSlot ? predecessor.parent : predecessor
    # use visibility of parent if not given or 'public' for group/global slots
    visibility ||= parent.visibility || 'public'
    slot_type = RE_SLOT_TYPES[visibility].to_s

    slotter.follow(predecessor)

    if reslot = where(slotter: slotter, parent: parent).take
      reslot.reuse_existing(predecessor, slot_type)
    else
      slot_class = slot_type.constantize
      reslot = slot_class.create(slotter: slotter,
                                 predecessor: predecessor,
                                 parent: parent,
                                 meta_slot: parent.meta_slot)
      reslot.create_activity
    end

    reslot
  end

  # for Pundit
  def self.policy_class
    ReSlotPolicy
  end

  ## Activity Methods ##

  private def activity_target
    predecessor
  end

  private def activity_actor
    slotter
  end

  # TODO: maybe the action can always be passed like: create_activity(action), this will also improve code readings
  private def activity_action
    'reslot'
  end
end
