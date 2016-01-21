json.id @group.id
json.slot_count @group.slots.size
json.upcoming_count @group.slots.upcoming.count
json.slots do
  json.partial! 'v1/slots/slots', slots: @group.slots
  # json.partial! 'v1/slots/slots', slots: @group.group_slots_with_associations
end
