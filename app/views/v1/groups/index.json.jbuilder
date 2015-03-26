json.array!(@groups) do |group|
  json.extract! group, :id, :name
  json.upcoming group.group_slots.upcoming.count
  json.image group.image ? group.image.public_id : nil
  json.url v1_group_url(group, format: :json)
end
