json.array!(@slots) do |slot|
  json.partial! 'v1/slots/slot', slot: slot
  json.url v1_slot_url(slot, format: :json)
end
