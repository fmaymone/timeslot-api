json.group_id @group.id
json.size @members.size
json.members do
  json.array!(@members) do |member|
    json.user_id member.id
    json.extract! member, :username
    json.user_url v1_user_url(member, format: :json)
  end
end
