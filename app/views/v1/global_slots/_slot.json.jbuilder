json.extract!(slot,
              :muid,
              :title,
              :start_date,
              :end_date,
              :image,
              :url,
              :description,
              # in the future, GlobalSlots can have multiple sources
              :sources
             )

json.location do
  json.name slot.loc_name
  json.locality slot.locality
  json.thoroughfare slot.thoroughfare
  json.country slot.country
  json.latitude slot.latitude
  json.longitude slot.longitude
end
