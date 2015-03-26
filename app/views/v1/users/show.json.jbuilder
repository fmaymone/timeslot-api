json.extract!(@user,
              :id,
              :username,
              :email,
              :default_private_alerts,
              :default_own_friendslot_alerts,
              :default_own_public_alerts,
              :default_friends_friendslot_alerts,
              :default_friends_public_alerts,
              :default_reslot_alerts,
              :default_group_alerts,
              :created_at,
              :updated_at,
              :deleted_at)
json.image @user.image ? @user.image.public_id : nil

tmp = []
if @user == current_user
       @user.initiated_friendships.active.each do |friendship|
       tmp.push( { 'friend_id' => friendship.friend.id, 'state' => friendship.humanize,
                     'initiator' => friendship.user_id } )
       end
       @user.received_friendships.active.each do |user|
       tmp.push( { 'friend_id' => user.user.id, 'state' => user.humanize,
                     'initiator' => user.user_id } )
       end

       json.friendships tmp
end
