json.partial! 'v1/users/basic_user', user: user
json.friendship_state friendship.nil? ? 'stranger' : friendship.humanize(current_user)
