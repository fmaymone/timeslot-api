json.id @group.uuid
json.size @group.members.size
json.members do
  json.array!(@group.members) do |member|
    json.extract! member, :id, :username
    json.image member.picture
    # json.user_url v1_user_url(member, format: :json)
  end
end
