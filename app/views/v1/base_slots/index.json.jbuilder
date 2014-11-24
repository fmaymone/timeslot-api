json.array!(@v1_base_slots) do |v1_base_slot|
  json.extract! v1_base_slot, :id
  json.url v1_base_slot_url(v1_base_slot, format: :json)
end
