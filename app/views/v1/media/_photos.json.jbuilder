json.photos media do |item|
  json.media_id item.id
  json.clyid item.public_id
  json.postition item.position
end
