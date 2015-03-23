json.extract! @group,
:id,
:name,
:owner_id,
:members_can_post,
:members_can_invite,
:created_at,
:updated_at,
:deleted_at

json.image @group.image ? @group.image.public_id : nil

json.membership_state current_user.get_membership(@group.id).state