json.extract!(slot,
              :id,
              :title,
              :created_at,
              :updated_at,
              :deleted_at,
              :start_date,
              :end_date
             )

json.location do
  if slot.location_id.nil?
    json.nil!
  else
    json.partial! 'v1/locations/show', location_data: slot.location
  end
end

json.creator do
  json.partial! 'v1/users/user', user: slot.creator
end

json.partial! 'v1/slots/settings', slot: slot if current_user

json.partial! 'v1/slots/visibility', slot: slot

json.group_id slot.group.id if slot.class == GroupSlot
# json.group_id slot.group.id if slot.try(:group)

json.slotter_id slot.slotter.id if slot.class == ReSlot

json.notes slot.notes, partial: 'v1/slots/note', as: :note

json.likes slot.likes.count
json.commentsCounter slot.comments.count

json.partial! 'v1/slots/share_url', share_id: slot.share_id

json.partial! 'v1/media/photos', media: slot.photos
json.partial! 'v1/media/voices', media: slot.voices
json.partial! 'v1/media/videos', media: slot.videos
