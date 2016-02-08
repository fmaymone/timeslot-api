json.id @group.uuid
json.members_counter @group.members.count
json.members do
  json.array!(@group.members) do |member|
    json.extract! member, :id, :username, :created_at, :updated_at, :deleted_at
    json.image member.picture
    # json.user_url v1_user_url(member, format: :json)
  end
end
