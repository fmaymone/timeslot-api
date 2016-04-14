json.result @memberships do |membership|
  json.partial! 'v1/groups/group', group: membership.group
  json.show_in_schedule membership.show_slots_in_schedule
  # json.notifications membership.notifications
end
