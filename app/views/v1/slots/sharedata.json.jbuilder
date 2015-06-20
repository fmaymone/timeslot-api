json.extract!(slot,
              :title,
              :created_at,
              :updated_at,
              :deleted_at,
              :start_date,
              :end_date
             )

if slot.location_id.nil? || slot.location.nil?
  json.address ''
else
  address = ""
  address << "#{slot.location.name}, " if slot.location.name
  address << "#{slot.location.street}, " if slot.location.thoroughfare
  address << "#{slot.location.city}, " if slot.location.locality
  address << "#{slot.location.postcode}, " if slot.location.postal_code
  address << "#{slot.location.country}" if slot.location.country
  json.address address
end

json.creator do
  json.partial! 'v1/users/user', user: slot.creator
end

if slot.class == StdSlot
  json.visibility slot.visibility
elsif slot.class == GroupSlot
  json.group_id slot.group.id
elsif slot.class == ReSlot
  json.slotter_id slot.slotter.id
end

json.notes slot.notes, partial: 'v1/slots/note', as: :note

json.partial! 'v1/slots/share_url', share_id: slot.share_id
json.shared_by slot.shared_by.username

json.images slot.images.try(:first) ? slot.images.first.public_id : nil
