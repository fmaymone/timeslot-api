json.array!(@slots) do |slot|
  json.extract!(slot,
                :id,
                :title,
                :startdate,
                :enddate,
                # :alerts,
                :note,
                :created_at,
                :updated_at,
                :deleted_at
               )
  json.creator_id slot.creator.id
  if slot.class == StdSlot
    json.visibility slot.visibility
  elsif slot.class == GroupSlot
    json.group_id slot.group.id
  end
  # json.url v1_slot_url(slot, format: :json)
  json.media slot.media_items do |slot|
    json.media_id slot.id
    json.media_type slot.media_type
    json.clyid slot.public_id
    json.ordering slot.ordering

    if slot.media_type == "voice"
      json.duration = slot.duration
    elsif slot.media_type == "video"
      json.duration = slot.duration
      json.thumbnail = slot.thumbnail
    end
  end
end
