json.extract!(slot,
              :id,
              :title,
              :start_date,
              :created_at,
              :updated_at,
              :deleted_at
             )
             
if slot.open_end == false
  json.end_date slot.end_date
end

json.location do
  if slot.location_id.nil? && slot.ios_location_id.nil?
    json.nil!
  elsif slot.location_id.nil?
    json.partial! 'v1/locations/show', location_data: slot.ios_location
  else
    json.partial! 'v1/locations/show', location_data: slot.location
  end
end

json.creator do
  json.partial! 'v1/users/user', user: slot.creator
end

json.notes slot.notes, partial: 'v1/slots/note', as: :note

json.partial! 'v1/media/media_items', media: slot.media_items

json.partial! 'v1/slots/settings', slot: slot if current_user

json.visibility slot.visibility if slot.try(:visibility)

# json.group_id slot.group.id if slot.class < GroupSlot
if slot.try(:group)
  json.group do
    json.id slot.group.id
  end
elsif slot.class == ReSlot
  json.slotter do
    json.id slot.slotter.id
  end
end

json.likes slot.likes.count

json.commentsCounter slot.comments.count

json.partial! 'v1/slots/share_url', share_id: slot.share_id
