class StdSlot < BaseSlot
  self.table_name = model_name.plural

  belongs_to :owner, class_name: User, inverse_of: :std_slots
  belongs_to :meta_slot

  validates :owner, presence: true
  validates :meta_slot, presence: true
end
