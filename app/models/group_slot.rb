class GroupSlot < BaseSlot
  self.table_name = model_name.plural

  belongs_to :group, inverse_of: :group_slots

  validates :group, presence: true

  def delete
    super
    group.members.each do |user|
      meta_slot.unregister user
    end
    group.touch
  end

  def self.add(meta_param, group_param, note_param = nil, alert_param = nil, user)
    meta_slot = MetaSlot.find_or_add(meta_param.merge(creator: user))
    return meta_slot unless meta_slot.errors.empty?

    slot = create(group_param.merge(meta_slot: meta_slot))
    return slot unless slot.errors.empty?

    slot.update_notes(note_param) if note_param
    SetAlerts.call(slot, user, alert_param) if alert_param
    slot
  end
end
