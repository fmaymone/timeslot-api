json.id group.uuid

json.extract!(
  group,
  :name,
  :image,
  :description,
  :members_can_post,
  :members_can_invite,
  :public,
  :created_at,
  :updated_at,
  :deleted_at
)

json.owner do
  json.partial! 'v1/users/user', user: group.owner
end

member_ids = group.member_ids
json.member_ids member_ids
json.member_count member_ids.count
json.slot_count group.slots.count
