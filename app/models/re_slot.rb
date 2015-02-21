class ReSlot < BaseSlot
  self.table_name = model_name.plural

  belongs_to :slotter, class_name: User, inverse_of: :re_slots
  belongs_to :predecessor, class_name: BaseSlot
  belongs_to :parent, class_name: BaseSlot

  validates :slotter, presence: true
  validates :predecessor, presence: true
  validates :parent, presence: true

  def related_users
    [slotter]
  end

  def self.create_from_slot(predecessor: nil, slotter: nil)
    original_source = predecessor.class == ReSlot ? predecessor.parent : predecessor
    create(slotter: slotter,
           predecessor: predecessor,
           parent: original_source,
           meta_slot: predecessor.meta_slot)
  end

  def chronic
    predecessors = []
    slot = self

    loop do
      break unless slot.try(:predecessor)
      slot = BaseSlot.get(slot.predecessor.id)
      if slot.deleted_at?
        Airbrake.notify(reslot_history_error: "found deleted predecessor: #{slot}")
      end
      predecessors << slot
    end

    predecessors
  end

  def prepare_for_deletion
    update_successors
  end

  private def update_successors
    successors = ReSlot.where(predecessor: self)
    successors.each do |slot|
      slot.update(predecessor: predecessor)
    end
  end

  # for Pundit
  def self.policy_class
    ReSlotPolicy
  end
end
