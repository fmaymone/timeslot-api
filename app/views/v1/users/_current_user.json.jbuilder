json.partial! 'v1/users/basic_user', user: @user

json.extract!(user,
              :lang,
              :email,
              :email_verified,
              :phone,
              :phone_verified,
              :public_url,
              :push,
              :slot_default_duration,
              :slot_default_location_id,
              :slot_default_type_id,
              :default_private_alerts,
              :default_own_friendslot_alerts,
              :default_own_public_alerts,
              :default_friends_friendslot_alerts,
              :default_friends_public_alerts,
              :default_reslot_alerts,
              :default_group_alerts
             )
tmp = []

user.initiated_friendships.active.each do |friendship|
  tmp.push( { 'friend_id' => friendship.friend.id,
              'state' => friendship.humanize,
              # 'push' => friendship.push,
              'initiator' => friendship.user_id } )
end

user.received_friendships.active.each do |friendship|
  tmp.push( { 'friend_id' => friendship.user.id,
              'state' => friendship.humanize,
              # 'push' => friendship.push,
              'initiator' => friendship.user_id } )
end

json.friendships tmp

json.memberships user.memberships.each do |membership|
  json.group_id membership.group_id
  json.state membership.humanize
  json.notifications membership.notifications
end
