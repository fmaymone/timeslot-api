json.array!(@groups) do |group|
  json.extract! group, :id, :name
  json.url v1_group_url(group, format: :json)
end
