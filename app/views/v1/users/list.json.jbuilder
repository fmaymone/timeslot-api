# this template is used for search results, and lists of friends
# TODO: wrap array in hash
json.array!(@users) do |user|
  json.partial! 'v1/users/user', user: user
  fs = current_user.friendship(user)

  if fs.nil?
    state = (current_user == user) ? 'myself' : 'stranger'
    json.friendship_state state
  else
    json.friendship_state fs.humanize(current_user)
  end
end
