json.array!(@users) do |user|
  json.extract! user, :id, :username
  json.image user.image ? user.image.public_id : nil
  json.url v1_user_url(user, format: :json)
end
