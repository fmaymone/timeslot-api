if user == current_user
  json.partial! 'v1/me/current_user', user: user
else
  json.partial! 'v1/users/full_user', user: user
  json.friendship_state friendship.nil? ? 'stranger' : friendship.humanize(current_user)
end

json.preview_slots slots do |slot|
  json.partial! 'v1/slots/slot_basics', slot: slot
end
