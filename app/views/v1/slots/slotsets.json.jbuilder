json.slot_sets @slotsets do |slotset|
  json.id slotset.uuid
  json.extract!(slotset,
                :name,
                :image,
                :created_at,
                :updated_at,
                :deleted_at
               )
  json.owner do
    json.id slotset.owner_id
  end
end
