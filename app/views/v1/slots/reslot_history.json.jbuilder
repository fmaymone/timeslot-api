json.predecessors @slot.chronic do |slot|
  json.extract! slot.slotter, :id, :username
  json.user_image slot.slotter.picture
  json.timestamp slot.created_at
end

json.parent_user do
  json.partial! 'v1/users/user', user: @slot.source.owner
end
