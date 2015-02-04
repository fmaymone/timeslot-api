json.array!(@slot.likes_with_details) do |like|
  json.created_at like.created_at
  json.user_id like.user.id
  json.username like.user.username
  json.userimage like.user.image ? like.user.image.public_id : nil
end
