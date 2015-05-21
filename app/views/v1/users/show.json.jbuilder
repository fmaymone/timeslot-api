if @user == current_user
  json.partial! 'v1/users/current_user', user: @user
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
