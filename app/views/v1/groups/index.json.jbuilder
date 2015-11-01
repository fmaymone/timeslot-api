json.array!(@groups) do |group|
  json.extract! group, :id, :name, :image
  json.upcomingCount group.group_slots.upcoming.count
  json.next group.group_slots.next.try(:start_date)
  json.url v1_group_url(group, format: :json)
end
