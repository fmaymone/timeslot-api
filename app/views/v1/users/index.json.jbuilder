json.array!(@users) do |user|
  json.extract! user, :id, :username
  json.url v1_user_url(user, format: :json)
end
