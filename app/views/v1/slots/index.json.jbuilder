json.array!(@slots) do |slot|
  json.extract!(slot,
                :id,
                :title,
                :location_id,
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
  json.likes slot.likes.count
  json.commentsCounter slot.comments.count

  json.partial! 'v1/media/photos', media: slot.photos
  json.partial! 'v1/media/voices', media: slot.voices
  json.partial! 'v1/media/videos', media: slot.videos

  if slot.class == StdSlot
    json.visibility slot.visibility
  elsif slot.class == GroupSlot
    json.group_id slot.group.id
  end
  json.url v1_slot_url(slot, format: :json)
  json.creator_id slot.creator.id
end
