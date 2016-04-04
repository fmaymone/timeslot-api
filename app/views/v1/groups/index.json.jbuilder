json.array!(@groups) do |group|
  json.id group.uuid
  json.extract! group, :name, :image, :public
  json.owner do
    json.partial! 'v1/users/user', user: group.owner
  end
  json.created_at group.created_at
  json.updated_at group.updated_at
  json.deleted_at group.deleted_at
end
