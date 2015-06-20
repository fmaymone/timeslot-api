json.videos media do |item|
  json.partial! 'v1/media/basic_media', item: item
  json.duration item.duration
  json.thumbnail item.thumbnail
end
