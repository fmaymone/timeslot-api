json.group_id memberships.first.group.uuid
json.size memberships.size
json.related do
  json.array!(memberships) do |membership|
    json.user_id membership.user.id
    json.state membership.humanize
    json.deleted_at membership.deleted_at
  end
end
