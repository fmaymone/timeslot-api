json.extract!(slot,
              :id,
              :title,
              :description,
              :start_date,
              :rrule,
              :allday,
              :created_at,
              :updated_at,
              :deleted_at
             )

json.end_date slot.end_date if slot.open_end == false

# TODO: simplify, rename 'ios_locaton' to 'location'
json.location do
  if slot.ios_location_id.nil?
    json.nil!
  else
    json.partial! 'v1/locations/show', location_data: slot.ios_location
  end
end

json.creator do
  json.partial! 'v1/users/user', user: slot.creator
end
