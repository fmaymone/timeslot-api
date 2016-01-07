class ReSlot < BaseSlot
  self.table_name = model_name.plural

  # make sure sti is not used until we populated the type columns for
  # existing values
  self.inheritance_column = :_type_disabled

  class ReslotHistroyError < StandardError; end

  belongs_to :slotter, class_name: User, inverse_of: :re_slots
  belongs_to :predecessor, class_name: BaseSlot
  belongs_to :parent, class_name: BaseSlot, counter_cache: true
  # atm parents are always StdSlot but later they might be eg. public groupslots
  # because of that I used BaseSlot as the associaton type

  delegate :media_items, :notes, :likes, :comments, :images, :audios, :videos,
           :reslots, :comments_count, :likes_count, :re_slots_count,
           :media_items=, :notes=, :likes=, :comments=, :images=, :audios=, :videos=,
           to: :parent

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

  def self.create_from_slot(predecessor:, slotter:)
    original_source = predecessor.class == ReSlot ? predecessor.parent : predecessor
    # TODO: use this when having reslot visibilities
    # original_source = predecessor.class < ReSlot ? predecessor.parent : predecessor

    # if same original event was already reslottet by user, use this reslot
    reslot = where(slotter: slotter, parent: original_source).take

    slotter.follow(predecessor)

    # if deleted reslot was reslottet again, unset deleted_at & update predecessor
    if reslot && reslot.deleted_at?
      reslot.update(deleted_at: nil)
      reslot.update(predecessor: predecessor)
      BaseSlot.increment_counter(:re_slots_count, reslot.parent_id)
      reslot.create_activity
    end

    unless reslot
      reslot = create(slotter: slotter,
                      predecessor: predecessor,
                      parent: original_source,
                      meta_slot: predecessor.meta_slot)
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
