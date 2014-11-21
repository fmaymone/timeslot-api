class StdSlot < BaseSlot
  self.table_name = 'std_slots'

  belongs_to :user, inverse_of: :std_slots

  validates :user, presence: true
end
