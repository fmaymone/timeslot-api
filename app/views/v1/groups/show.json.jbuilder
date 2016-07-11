json.partial! 'v1/groups/group', group: @group

membership = current_user.get_membership(@group.id)
if membership
  json.membership_state membership.humanize
  json.color membership.color
else
  json.membership_state 'undefined'
end
