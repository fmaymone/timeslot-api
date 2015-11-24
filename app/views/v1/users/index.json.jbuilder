json.array!(@users) do |user|
  json.extract! user, :id, :username
  json.image user.picture
  fs = current_user.friendship(user)
  fss = fs.try(:state)
  json.friendship_state fss != '00' ? fss : (fs.user == current_user ? '10' : fss)
  json.url v1_user_url(user, format: :json)
end
