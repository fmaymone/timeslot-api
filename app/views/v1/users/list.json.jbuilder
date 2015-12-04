json.array!(@users) do |user|
  fs = current_user.friendship(user)
  json.partial! 'v1/users/extended_user', user: user, friendship: fs
end
