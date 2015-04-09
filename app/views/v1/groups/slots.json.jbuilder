json.group_id @group.id
json.slot_count @group.group_slots.size
json.upcoming_count @group.group_slots.upcoming.count
json.slots do
  json.array!(@group.group_slots) do |slot|
    json.partial! 'v1/slots/slot_basic', slot: slot
  end
end
