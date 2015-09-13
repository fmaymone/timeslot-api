json.array!(@locations) do |location|
  json.partial! 'v1/locations/show', location_data: location
end
