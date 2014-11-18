json.group_id @group.id
json.size @memberships.size
json.related do
  json.array!(@memberships) do |membership|
    json.user_id membership.user.id
    json.extract! membership, :state
  end
end
