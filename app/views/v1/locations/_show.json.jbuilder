if location_data.nil?
  json.null!
else
  json.id location_data.id
  json.name location_data.name
  json.street location_data.street
  json.city location_data.city
  json.postcode location_data.postcode
  json.country location_data.country
  json.longitude location_data.longitude
  json.latitude location_data.latitude
  json.created_at location_data.created
  json.updated_at location_data.last_update
  json.categories location_data.categories
  json.images location_data.images
end
