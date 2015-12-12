json.extract!(slot,
              :uuid,
              :title,
              :start_date,
              :end_date
             )

json.location do
  json.name slot.loc_name
  json.locality slot.locality
  json.thoroughfare slot.thoroughfare
  json.country slot.country
  json.latitude slot.latitude
  json.longitude slot.longitude
end

json.creator do
  json.partial! 'v1/users/user', user: slot.creator
end

json.notes [
  {
    "title" => "description",
    "content" => slot.description
  },
  {
    "title" => "url",
    "content" => slot.url
  }
]

json.media do
  json.public_id slot.image
  json.mediaType "image"
end
