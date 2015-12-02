if user == current_user
  json.partial! 'v1/me/current_user', user: user
else
  json.partial! 'v1/users/extended_user', user: user, friendship: friendship
end
