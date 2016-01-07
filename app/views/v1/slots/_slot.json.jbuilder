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
  if slot.location_uid.nil? && slot.ios_location_id.nil?
    json.nil!
  elsif slot.location_uid.nil?
    json.partial! 'v1/locations/show', location_data: slot.ios_location
  else
    json.partial! 'v1/locations/candy_location', location_data: slot.location
  end
end

json.creator do
  json.partial! 'v1/users/user', user: slot.creator
end

json.notes slot.notes, partial: 'v1/slots/note', as: :note

json.media do
  json.partial! 'v1/media/media_items', media: slot.media_items
end

json.partial! 'v1/slots/settings', slot: slot if current_user

json.visibility slot.visibility if slot.try(:visibility)

# json.group_id slot.group.id if slot.class < GroupSlot
if slot.try(:group)
  json.group do
    json.id slot.group.id
  end
else
  json.reslotsCounter slot.re_slots_count

  if slot.class <= ReSlot
    json.slotter do
      json.id slot.slotter_id
    end
    json.parent do
      json.id slot.parent_id
    end
  end
end

# if we have a crawler slot/reslot, return the muid
json.muid slot.muid if slot.try(:muid)

json.likes slot.likes_count
json.commentsCounter slot.comments_count

json.partial! 'v1/slots/share_url', share_id: slot.share_id
