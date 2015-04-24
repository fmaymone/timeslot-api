class StdSlot < BaseSlot
  self.table_name = model_name.plural
  # include OptimallyInheritable
  # support_sti_for %w(StdSlotPrivate StdSlotPublic)

  belongs_to :owner, class_name: User, inverse_of: :std_slots
  # for some strange reason the association is not found even tough it
  # works for meta_slot just the same
  belongs_to :shared_by, class_name: User

  validates :meta_slot, presence: true
  # validates :visibility, presence: true # TODO: remove

  def related_users
    [owner]
  end

  def prepare_for_deletion
  end

  # I can throw a User object at this and AR automagically takes the ID - nice
  # or dangerous?
  # btw I made this classmethod to circumvent my default_scope on the slot_type
  def self.of(user_id)
    StdSlot.unscoped.where(owner: user_id)
  end

  def self.create_slot(meta_slot:, visibility:, user: nil)
    case visibility
    when 'private'
      slot_type = StdSlotPrivate
    when 'friends'
      slot_type = StdSlotFriends
    when 'public'
      slot_type = StdSlotPublic
    end

    slot_type.create(meta_slot: meta_slot, owner: user)
  end

  # for Pundit
  def self.policy_class
    StdSlotPolicy
  end
end
