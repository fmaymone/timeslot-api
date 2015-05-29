json.extract!(slot,
              :id,
              :title,
              :start_date,
              :created_at,
              :updated_at,
              :deleted_at
             )

json.end_date slot.open_end ? nil : slot.end_date

if current_user
  json.partial! 'v1/slots/settings', slot: slot
end

json.partial! 'v1/media/photos', media: slot.photos
json.partial! 'v1/media/voices', media: slot.voices
json.partial! 'v1/media/videos', media: slot.videos

json.url v1_slot_url(slot, format: :json)
