json.calendars @memberships do |membership|
  json.id membership.group.uuid
  json.extract! membership.group,
                :name, :image, :public, :created_at, :updated_at, :deleted_at
  json.show_in_schedule membership.show_slots_in_schedule
  # json.notifications membership.notifications
  json.owner do
    json.partial! 'v1/users/user', user: membership.group.owner
  end
end
