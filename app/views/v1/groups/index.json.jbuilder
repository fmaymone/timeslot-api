json.result (@groups||groups) do |group|
  json.partial! 'v1/groups/group', group: group

  json.preview_slots group.preview_slots do |slot|
    json.partial! 'v1/slots/slot_preview', slot: slot
  end
end
