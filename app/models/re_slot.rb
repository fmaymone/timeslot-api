class ReSlot < BaseSlot
  self.table_name = model_name.plural

  belongs_to :slotter, class_name: User, inverse_of: :re_slots
  belongs_to :predecessor, class_name: BaseSlot
  belongs_to :meta_slot

  validates :slotter, presence: true
  validates :predecessor, presence: true
  validates :predecessor_type, presence: true
  validates :meta_slot, presence: true
end
