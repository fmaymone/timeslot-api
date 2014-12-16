json.videos media do |item|
  json.media_id item.id
  json.clyid item.public_id
  json.ordering item.ordering
  json.duration = item.duration
  json.thumbnail = item.thumbnail
end
