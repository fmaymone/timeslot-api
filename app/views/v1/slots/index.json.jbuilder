json.array!(@slots) do |slot|
  json.extract!(slot,
                :id,
                :title,
                :startdate,
                :enddate,
                :created_at,
                :updated_at,
                :deleted_at
               )
  json.alerts slot.alerts(current_user) if current_user
  json.notes slot.notes do |note|
    json.title note.title
    json.content note.content
    json.created note.created_at
  end
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
