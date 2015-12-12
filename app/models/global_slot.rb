class GlobalSlot < BaseSlot
  self.table_name = model_name.plural

  validates_presence_of :cuid, :duid, :url#, :crawler_id
end
