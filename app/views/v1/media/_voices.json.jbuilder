json.voices media do |item|
  json.media_id item.id
  json.clyid item.public_id
  json.ordering item.ordering
  json.duration = item.duration
end
