json.array!(@users) do |user|
  json.partial! 'v1/users/basic_user', user: user
end
