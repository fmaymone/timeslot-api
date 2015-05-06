json.extract!(@user,
              :id,
              :username,
              :email,
              :email_verified,
              :phone,
              :phone_verified,
              :public_url,
              :location_id,
              :slot_default_duration,
              :slot_default_location_id,
              :slot_default_type_id,
              :default_private_alerts,
              :default_own_friendslot_alerts,
              :default_own_public_alerts,
              :default_friends_friendslot_alerts,
              :default_friends_public_alerts,
              :default_reslot_alerts,
              :default_group_alerts,
              :push,
              :created_at,
              :updated_at,
              :deleted_at)
json.image @user.image ? @user.image.public_id : nil

json.slot_count @user.std_slots.count
json.reslot_count @user.re_slots.count
json.friends_count @user.friends.count

if @user == current_user
  tmp = []

  @user.initiated_friendships.active.each do |friendship|
    tmp.push( { 'friend_id' => friendship.friend.id,
                'state' => friendship.humanize,
                'initiator' => friendship.user_id } )
  end

  @user.received_friendships.active.each do |friendship|
    tmp.push( { 'friend_id' => friendship.user.id,
                'state' => friendship.humanize,
                'initiator' => friendship.user_id } )
  end

  json.friendships tmp

  json.groups @user.memberships.each do |membership|
    json.group_id membership.group_id
    json.state membership.humanize
  end
end
