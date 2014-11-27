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
end
