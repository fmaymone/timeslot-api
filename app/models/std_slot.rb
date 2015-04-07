class StdSlot < BaseSlot
  self.table_name = model_name.plural

  belongs_to :owner, class_name: User, inverse_of: :std_slots

  validates :meta_slot, presence: true
  validates :visibility, presence: true

  def related_users
    [owner]
  end

  def private?
    visibility == "00"
  end

  def friendslot?
    visibility == "01"
  end

  def public?
    visibility == "11"
  end

  def prepare_for_deletion
  end

  def self.create_with_meta(meta_param, std_param, note_param = nil,
                            alert_param = nil, user)
    meta_slot = MetaSlot.find_or_add(meta_param.merge(creator: user))
    return meta_slot unless meta_slot.errors.empty?

    slot = create(std_param.merge(meta_slot: meta_slot, owner: user))
    return slot unless slot.errors.empty?

    slot.update_notes(note_param) if note_param
    user.update_alerts(slot, alert_param) if alert_param
    slot
  end

  # for Pundit
  def self.policy_class
    StdSlotPolicy
  end
end
