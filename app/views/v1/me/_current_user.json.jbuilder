json.partial! 'v1/users/full_user', user: user

json.extract!(user,
              :lang,
              :email,
              :email_verified,
              :phone,
              :phone_verified,
              :public_url,
              :push
              # :slot_default_duration,
              # :slot_default_location_id,
              # :slot_default_type_id,
              # :default_private_alerts,
              # :default_own_friendslot_alerts,
              # :default_own_public_alerts,
              # :default_friends_friendslot_alerts,
              # :default_friends_public_alerts,
              # :default_reslot_alerts,
              # :default_group_alerts
             )

json.my_calendar_uuid user.my_cal_uuid
json.friends_calendar_uuid user.friends_cal_uuid
json.all_my_slots_uuid user.my_lib_uuid
json.my_created_slots_uuid user.my_created_slots_uuid
json.my_private_slots_uuid user.my_private_slots_uuid
json.my_friend_slots_uuid user.my_friend_slots_uuid
json.my_public_slots_uuid user.my_public_slots_uuid

tmp = []

user.initiated_friendships.active.each do |friendship|
  tmp.push('friend_id' => friendship.friend.id,
           'state' => friendship.humanize,
           # 'push' => friendship.push,
           'initiator' => friendship.user_id)
end

user.received_friendships.active.each do |friendship|
  tmp.push('friend_id' => friendship.user.id,
           'state' => friendship.humanize,
           # 'push' => friendship.push,
           'initiator' => friendship.user_id)
end

json.friendships tmp

json.memberships user.memberships.each do |membership|
  json.group_id membership.group_id
  json.state membership.humanize
  json.color membership.color
  json.notifications membership.notifications
end

# overwrite slot_count if query for yourself
json.slot_count user.std_slots.active.count

# send friendship state for current_user as this makes things for frontend easier
json.friendship_state 'myself'
