class GroupSlot < BaseSlot
  self.table_name = model_name.plural

  belongs_to :group, inverse_of: :group_slots

  validates :group, presence: true
end
