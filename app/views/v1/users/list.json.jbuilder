json.array!(@users) do |user|
  json.partial! 'v1/users/basic_user', user: user
  fs = current_user.friendship(user)
  fss = fs.try(:state)
  json.friendship_state fss != '00' ? fss : (fs.user == current_user ? '10' : fss)
end
