json.extract!(user,
              :id,
              :username,
              # :picture,
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

# we would need to differentiate the counts based on the relationship of the
# rendered user to the current user
# for friends the count would include friend-visible slots, for strangers
# it would only count public slots -> sounds like an exhibitor is neccessary
# however, should check back with stani before implementing
json.slot_count user.std_slots_public.count
json.reslot_count user.re_slots.count
json.friends_count user.friends.count
