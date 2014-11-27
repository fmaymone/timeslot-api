class GroupSlot < BaseSlot
  self.table_name = 'group_slots'

  belongs_to :group, inverse_of: :group_slots
  belongs_to :meta_slot

  validates :meta_slot, presence: true
  validates :group, presence: true
end
