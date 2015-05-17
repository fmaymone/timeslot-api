json.array!(@slot.comments_with_details) do |comment|
  json.created_at comment.created_at
  json.content comment.content
  json.user_id comment.user.id
  json.username comment.user.username
  json.userimage comment.user.image ? comment.user.image.public_id : nil
end
