class GroupSlot < BaseSlot
  self.table_name = 'group_slots'

  belongs_to :group, inverse_of: :group_slots

  validates :group, presence: true
end
