json.extract!(
  @group,
  :id,
  :name,
  :members_can_post,
  :members_can_invite,
  :created_at,
  :updated_at,
  :deleted_at
)

json.image @group.image ? @group.image.public_id : nil

json.owner do
  json.partial! 'v1/users/user', user: @group.owner
end

json.membership_state current_user.get_membership(@group.id).humanize
