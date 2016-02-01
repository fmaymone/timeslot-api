json.id @group.uuid
json.size @group.members.size
json.members do
  json.array!(@group.members) do |member|
    json.id member.id
    json.extract! member, :username
    json.user_url v1_user_url(member, format: :json)
  end
end
