json.videos media do |item|
  json.media_id item.id
  json.clyid item.public_id
  json.position item.position
  json.duration = item.duration
  json.thumbnail = item.thumbnail
end
