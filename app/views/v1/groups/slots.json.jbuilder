json.id @group.id
json.slot_count @group.group_slots.size
json.upcoming_count @group.group_slots.upcoming.count
json.slots do
  json.partial! 'v1/slots/slots', slots: @group.group_slots
end
