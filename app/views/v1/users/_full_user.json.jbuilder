json.partial! 'v1/users/user', user: user

json.location do
  if user.location_id.nil?
    json.nil!
  else
    json.partial! 'v1/locations/show', location_data: user.location
  end
end

json.slot_count user.visible_slots_counter(current_user, StdSlot)
json.calendar_count user.visible_calendars_counter(current_user)
json.friends_count user.friends_count
