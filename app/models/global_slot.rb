class GlobalSlot < BaseSlot
  self.table_name = model_name.plural

  validates :muid, presence: true
end
