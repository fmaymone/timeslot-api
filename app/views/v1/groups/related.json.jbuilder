json.group_id memberships.first.group_id
json.size memberships.size
json.related do
  json.array!(memberships) do |membership|
    json.user_id membership.user.id
    json.extract! membership, :state, :deleted_at
  end
end
