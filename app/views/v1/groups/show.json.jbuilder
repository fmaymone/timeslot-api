json.id @group.uuid

json.extract!(
  @group,
  :name,
  :image,
  :members_can_post,
  :members_can_invite,
  :public,
  :created_at,
  :updated_at,
  :deleted_at
)

json.owner do
  json.partial! 'v1/users/user', user: @group.owner
end

json.membership_state current_user.get_membership(@group.id).humanize
