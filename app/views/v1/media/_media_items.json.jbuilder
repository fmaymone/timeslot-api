json.media media do |item|
  json.media_id item.id
  json.media_type item.media_type
  json.clyid item.public_id
  json.position item.position

  if item.media_type == "voice"
    json.duration = item.duration
  elsif item.media_type == "video"
    json.duration = item.duration
    json.thumbnail = item.thumbnail
  end
end
