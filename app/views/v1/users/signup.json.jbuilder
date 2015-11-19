json.partial! 'v1/me/current_user', user: @user
json.auth_token @user.auth_token
