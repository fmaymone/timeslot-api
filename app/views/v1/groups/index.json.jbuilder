json.array!(@groups) do |group|
  json.id group.uuid
  json.extract! group, :name, :image, :description, :public,
                       :created_at, :updated_at, :deleted_at
  json.owner do
    json.partial! 'v1/users/user', user: group.owner
  end
end
