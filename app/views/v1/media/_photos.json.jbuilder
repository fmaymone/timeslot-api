json.photos media do |item|
  json.media_id item.id
  json.clyid item.public_id
  json.position item.position
end
