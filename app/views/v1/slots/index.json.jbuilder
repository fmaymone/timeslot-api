json.array!(@slots) do |slot|
  json.extract!(slot,
                :id,
                :title,
                :created_at,
                :updated_at,
                :deleted_at,
                :start_date,
                :end_date
               )

  if current_user
    json.partial! 'v1/slots/settings', slot: slot
  end

  json.notes slot.notes, partial: 'v1/slots/note', as: :note

  json.media slot.media_items do |item|
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
  if slot.class == StdSlot
    json.visibility slot.visibility
  elsif slot.class == GroupSlot
    json.group_id slot.group.id
  end
  json.url v1_slot_url(slot, format: :json)
  json.creator_id slot.creator.id
end
