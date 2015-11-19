if @user == current_user
  json.partial! 'v1/me/current_user', user: @user
else
  json.partial! 'v1/users/basic_user', user: @user
end
