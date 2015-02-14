class ReSlot < BaseSlot
  self.table_name = model_name.plural

  belongs_to :slotter, class_name: User, inverse_of: :re_slots
  belongs_to :predecessor, class_name: BaseSlot

  validates :slotter, presence: true
  validates :predecessor, presence: true

  def related_users
    [slotter]
  end

  def self.create_from_slot(predecessor: nil, slotter: nil)
    create(slotter: slotter,
           predecessor: predecessor,
           meta_slot: predecessor.meta_slot)
  end

  def chronic
    predecessors = []
    slot = self

    loop do
      break unless slot.try(:predecessor)
      slot = BaseSlot.get(slot.predecessor.id)
      predecessors << slot
    end

    predecessors
  end

  # for Pundit
  def self.policy_class
    ReSlotPolicy
  end
end
