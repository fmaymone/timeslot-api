json.array!(media) do |item|
  json.partial! 'v1/media/basic_media', item: item
  json.media_type item.media_type
  json.created_at item.created_at

  if item.media_type == 'audio'
    json.duration item.duration
    json.title item.title
  elsif item.media_type == 'video'
    json.duration item.duration
    json.thumbnail item.thumbnail
  end
end
