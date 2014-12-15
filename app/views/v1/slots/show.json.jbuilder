json.extract!(@slot,
              :id,
              :title,
              :created_at,
              :updated_at,
              :deleted_at,
              :start_date,
              :end_date
             )

json.location do
  if @slot.location_id.nil?
    json.nil!
  else
    json.partial! 'v1/locations/show', location_data: @slot.location
  end
end

json.creator do
  json.partial! 'v1/users/user', user: @slot.creator
end

if current_user
  json.partial! 'v1/slots/settings', slot: @slot
end

if @slot.class == StdSlot
  json.visibility @slot.visibility
elsif @slot.class == GroupSlot
  json.group_id @slot.group.id
elsif @slot.class == ReSlot
  json.slotter_id @slot.slotter.id
end

json.notes @slot.notes, partial: 'v1/slots/note', as: :note

json.media @slot.media_items do |item|
  json.media_id item.id
  json.media_type item.media_type
  json.clyid item.public_id
  json.ordering item.ordering

  if item.media_type == "voice"
    json.duration = item.duration
  elsif item.media_type == "video"
    json.duration = item.duration
    json.thumbnail = item.thumbnail
  end
end
