class GroupSlot < BaseSlot
  self.table_name = model_name.plural

  belongs_to :group, inverse_of: :group_slots

  validates :group, presence: true

  def related_users
    group.members
  end

  def prepare_for_deletion
    group.touch unless group.deleted_at?
  end

  def self.create_slot(meta_slot:, group:)
    # I don't have public groups yet, adjust later
    if group.try(:public?)
      slot_type = GroupSlotPublic
    else
      slot_type = GroupSlotMembers
    end

    slot = slot_type.create(group: group, meta_slot: meta_slot)
    slot.create_activity
  end

  # for Pundit
  def self.policy_class
    GroupSlotPolicy
  end
end
