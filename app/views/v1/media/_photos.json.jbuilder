json.photos media do |item|
  json.partial! 'v1/media/basic_media', item: item
end
