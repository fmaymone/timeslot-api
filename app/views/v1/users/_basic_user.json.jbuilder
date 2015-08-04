json.extract!(user,
              :id,
              :username,
              :created_at,
              :updated_at,
              :deleted_at
             )

json.location do
  if user.location_id.nil?
    json.nil!
  else
    json.partial! 'v1/locations/show', location_data: user.location
  end
end

json.image do
  json.public_id user.image.try(:public_id) ? user.image.public_id : nil
  json.local_id user.image.try(:local_id) ? user.image.local_id : nil
end

json.slot_count user.std_slots.unscoped.count
json.reslot_count user.re_slots.count
json.friends_count user.friends.count
