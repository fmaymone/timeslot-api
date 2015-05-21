json.partial! 'v1/users/current_user', user: @user
json.auth_token @user.auth_token
