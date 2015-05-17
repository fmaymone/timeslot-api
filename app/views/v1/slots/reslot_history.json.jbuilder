json.predecessors @slot.chronic do |slot|
  json.extract! slot.slotter, :id, :username
  json.user_image slot.slotter.image ? slot.slotter.image.public_id : nil
  json.timestamp slot.created_at
end
json.parent_user_id @slot.source.owner.id
json.parent_username @slot.source.owner.username
json.parent_user_image @slot.source.owner.image ? @slot.source.owner.image.public_id : nil
