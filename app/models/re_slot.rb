class ReSlot < BaseSlot
  self.table_name = model_name.plural

  class ReslotHistroyError < StandardError; end

  belongs_to :slotter, class_name: User, inverse_of: :re_slots
  belongs_to :predecessor, class_name: BaseSlot
  belongs_to :parent, class_name: BaseSlot

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

  def reslot_count
    ReSlot.unscoped.where(parent_id: parent_id).count
  end

  def related_users
    [slotter]
  end

  def prepare_for_deletion
    update_successors
  end

  def delete
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

    # if same original event was already reslottet by user, use this reslot
    where(slotter: slotter, parent: original_source).first_or_create(
      slotter: slotter,
      predecessor: predecessor,
      parent: original_source,
      meta_slot: predecessor.meta_slot
    )
  end

  # for Pundit
  def self.policy_class
    ReSlotPolicy
  end
end
