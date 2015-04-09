json.group_id @group.id
json.slot_count @group.group_slots.size
json.slots do
  json.array!(@group.group_slots) do |slot|
    json.partial! 'v1/slots/slot', slot: slot
  end
end
