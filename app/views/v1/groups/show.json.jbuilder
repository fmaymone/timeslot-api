json.partial! 'v1/groups/group', group: @group

json.membership_state current_user.get_membership(@group.id).humanize
