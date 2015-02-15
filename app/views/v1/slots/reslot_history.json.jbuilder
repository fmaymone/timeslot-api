json.array! @slot.chronic do |slot|
  json.timestamp slot.created_at

  if slot.try(:predecessor)
    json.extract! slot.slotter, :id, :username
    json.user_image slot.slotter.image ? slot.slotter.image.public_id : nil
  else
    json.parent_user_id slot.owner.id
    json.parent_username slot.owner.username
    json.parent_user_image slot.owner.image ? slot.owner.image.public_id : nil
  end
end
