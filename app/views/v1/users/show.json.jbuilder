if @user == current_user
  json.extract!(@user,
                :id,
                :username,
                :email,
                :email_verified,
                :phone,
                :phone_verified,
                :public_url,
                :location_id,
                :location_name,
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
                # :push, # wird gerade ueberarbeitet
                :created_at,
                :updated_at,
                :deleted_at
               )
  tmp = []

  @user.initiated_friendships.active.each do |friendship|
    tmp.push( { 'friend_id' => friendship.friend.id,
                'state' => friendship.humanize,
                # 'push' => friendship.push,
                'initiator' => friendship.user_id } )
  end

  @user.received_friendships.active.each do |friendship|
    tmp.push( { 'friend_id' => friendship.user.id,
                'state' => friendship.humanize,
                # 'push' => friendship.push,
                'initiator' => friendship.user_id } )
  end

  json.friendships tmp

  json.memberships @user.memberships.each do |membership|
    json.group_id membership.group_id
    json.state membership.humanize
    json.notifications membership.notifications
  end

else
  json.extract!(@user,
                :id,
                :username,
                :location_id,
                :location_name,
                :created_at,
                :updated_at,
                :deleted_at
               )
end

json.image @user.image ? @user.image.public_id : nil

json.slot_count @user.std_slots.count
json.reslot_count @user.re_slots.count
json.friends_count @user.friends.count
