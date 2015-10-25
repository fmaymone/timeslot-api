class ReSlot < BaseSlot
  self.table_name = model_name.plural

  class ReslotHistroyError < StandardError; end

  belongs_to :slotter, class_name: User, inverse_of: :re_slots
  belongs_to :predecessor, class_name: BaseSlot
  belongs_to :parent, class_name: BaseSlot
  # atm parents are always StdSlot but later they might be eg. public groupslots
  # because of that I used BaseSlot as the associaton type

  delegate :media_items, :notes, :likes, :comments, :images, :audios, :videos,
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

  def reslots
    source.reslots
  end

  def reslot_count
    # source.reslot_count
    ReSlot.unscoped.where(parent_id: parent_id).count
  end

  def related_users
    [slotter]
  end

  def prepare_for_deletion
    update_successors
  end

  def delete
    remove_all_followers
    slotter.unfollow(predecessor)
    slotter.prepare_for_slot_deletion self
    prepare_for_deletion
    ts_soft_delete
  end

  private def update_successors
    successors = ReSlot.where(predecessor: self)
    successors.each do |slot|
      slot.update(predecessor: predecessor)
    end
  end

  def self.create_from_slot(predecessor: nil, slotter: nil)
    original_source = predecessor.class == ReSlot ? predecessor.parent : predecessor
    # TODO: use this when having reslot visibilities
    # original_source = predecessor.class < ReSlot ? predecessor.parent : predecessor

    # if same original event was already reslottet by user, use this reslot
    reslot = where(slotter: slotter, parent: original_source).take

    # if deleted reslot was reslottet again, unset deleted_at & update predecessor
    if reslot && reslot.deleted_at?
      reslot.update(deleted_at: nil)
      reslot.update(predecessor: predecessor)
    end

    slotter.follow(predecessor)

    reslot || create(slotter: slotter,
                     predecessor: predecessor,
                     parent: original_source,
                     meta_slot: predecessor.meta_slot)
  end

  # for Pundit
  def self.policy_class
    ReSlotPolicy
  end

  ## Activity Methods ##

  private

  def activity_target
    self
  end

  def activity_actor
    slotter
  end

  def activity_verb
    'reslot'
  end

  def activity_foreign
    parent
  end
end
