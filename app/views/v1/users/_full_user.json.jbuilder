json.partial! 'v1/users/user', user: user

json.location do
  if user.location_id.nil?
    json.nil!
  else
    json.partial! 'v1/locations/show', location_data: user.location
  end
end

# we would need to differentiate the counts based on the relationship of the
# rendered user to the current user
# for friends the count would include friend-visible slots, for strangers
# it would only count public slots -> sounds like an exhibitor is neccessary
# however, should check back with stani before implementing
json.slot_count user.visible_slots_counter(current_user)

json.reslot_count user.re_slots.active.count
json.friends_count user.friends.count
