json.array!(@slot.likes_with_details) do |like|
  json.created_at like.created_at
  json.liker do
    json.partial! 'v1/users/user', user: like.user
  end
end
