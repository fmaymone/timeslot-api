if user == current_user
  json.partial! 'v1/me/current_user', user: user
else
  json.partial! 'v1/users/full_user', user: user
  json.friendship_state friendship.nil? ? 'stranger' : friendship.humanize(current_user)
end
