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

json.friends @user.friends do |friend| 
       json.id friend.id
       json.username friend.username
end

json.offered_friends @user.offered_friends do |user|
       json.id user.id
end
