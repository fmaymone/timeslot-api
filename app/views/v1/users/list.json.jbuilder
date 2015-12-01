json.array!(@users) do |user|
  json.partial! 'v1/users/basic_user', user: user
  fs = current_user.friendship(user)
  fss = fs.try(:state)
  json.friendship_state (fss == '11' ? 'friend' : (fss == '00' ? 'pending' : nil))
end
