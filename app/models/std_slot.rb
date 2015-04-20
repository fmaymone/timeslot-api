class StdSlot < BaseSlot
  self.table_name = model_name.plural
  # include OptimallyInheritable
  # support_sti_for %w(StdSlotPrivate StdSlotPublic)

  belongs_to :owner, class_name: User, inverse_of: :std_slots
  # for some strange reason the association is not found even tough it
  # works for meta_slot just the same
  belongs_to :shared_by, class_name: User

  validates :meta_slot, presence: true
  validates :visibility, presence: true # TODO: remove

  def related_users
    [owner]
  end

  # TODO: remove this three helpers
  def private?
    self.StdSlotPrivate?
    # visibility == "00"
  end

  def friendslot?
    self.StdSlotFriends?
    # visibility == "01"
  end

  def public?
    self.StdSlotPublic?
    # visibility == "11"
  end

  def prepare_for_deletion
  end

  # I can throw a User object at this and AR automagically takes the ID - nice
  # or dangerous?
  # btw I made this classmethod to circumvent my default_scope on the slot_type
  def self.of(user_id)
    StdSlot.unscoped.where(owner: user_id)
  end

  def self.create_with_meta(meta:, visibility:, media: nil, notes: nil,
                            alerts: nil, user: nil)
    meta_slot = MetaSlot.find_or_add(meta.merge(creator: user))
    return meta_slot unless meta_slot.errors.empty?

    slot = create(visibility.merge(meta_slot: meta_slot, owner: user))
    return slot unless slot.errors.empty?

    slot.update_from_params(meta: nil, media: media, notes: notes,
                            alerts: alerts, user: user)
    slot
  end

  # for Pundit
  def self.policy_class
    StdSlotPolicy
  end
end
