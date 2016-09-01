json.partial! 'v1/slots/slot_basics', slot: slot

json.notes slot.notes, partial: 'v1/slots/note', as: :note

json.media do
  json.partial! 'v1/media/media_items', media: slot.media_items
end

json.partial! 'v1/slots/settings', slot: slot if current_user

json.visibility slot.visibility if slot.try(:visibility)

# json.reslotsCounter slot.re_slots_count

# if we have a global slot, return the muid
json.muid slot.reload.slot_uuid if slot.GlobalSlot?

json.liker_ids slot.likes.pluck :user_id
json.likes slot.likes_count
json.commentsCounter slot.comments_count

json.first_group do
  if first_group = slot.first_group(current_user)
    json.partial! 'v1/groups/group', group: first_group
  else
    json.nil!
  end
end

json.slot_group_uuids slot.slot_groups.pluck(:uuid)
