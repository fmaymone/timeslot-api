json.array!(@slot.comments_with_details) do |comment|
  json.created_at comment.created_at
  json.content comment.content
  json.commenter do
    json.partial! 'v1/users/user', user: comment.user
  end
end
