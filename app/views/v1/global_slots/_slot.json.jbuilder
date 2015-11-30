# coding: utf-8
json.extract!(slot,
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
    'title' => "crawler ID",
    "content" => slot.crawler_id
  },
  {
    "title" => "description",
    "content" => slot.description
  },
  {
    "title" => "tags",
    "content" => slot.tags
  },
  {
    "title" => "url",
    "content" => slot.url
  },
  {
    "title" => "cuid",
    "content" => slot.cuid
  },
  {
    "title" => "duid",
    "content" => slot.duid
  }
]

json.media do
  json.public_id slot.images
  json.mediaType "image"
end
