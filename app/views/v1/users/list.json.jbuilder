# this template is used for search results
json.array!(@users) do |user|
  json.partial! 'v1/users/user', user: user
  fs = current_user.friendship(user)
  json.friendship_state fs.nil? ? 'stranger' : fs.humanize(current_user)
end
