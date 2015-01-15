class StdSlot < BaseSlot
  self.table_name = model_name.plural

  belongs_to :owner, class_name: User, inverse_of: :std_slots

  validates :meta_slot, presence: true

  def delete
    super
    meta_slot.unregister owner
  end
end
