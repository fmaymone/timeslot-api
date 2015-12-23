if location_data.nil?
  json.null!
else
  json.name location_data.name.blank? ? nil : location_data.name
  json.thoroughfare location_data.thoroughfare
  json.sub_thoroughfare location_data.sub_thoroughfare
  json.locality location_data.locality
  json.sub_locality location_data.sub_locality
  json.administrative_area location_data.administrative_area
  json.sub_administrative_area location_data.sub_administrative_area
  json.postal_code location_data.postal_code
  json.country location_data.country
  json.iso_country_code location_data.iso_country_code
  json.in_land_water location_data.in_land_water
  json.ocean location_data.ocean
  json.areas_of_interest location_data.areas_of_interest
  json.latitude location_data.latitude
  json.longitude location_data.longitude
end
