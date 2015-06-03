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

json.image user.image ? user.image.public_id : nil

json.slot_count user.std_slots.count
json.reslot_count user.re_slots.count
json.friends_count user.friends.count
