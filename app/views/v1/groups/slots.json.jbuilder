json.id @group.uuid
json.slot_count @group.slots.size
json.upcoming_count @group.slots.upcoming.count
json.slots do
  json.partial! 'v1/slots/slots', slots: @group.slots_with_associations
end
