json.partial! 'v1/slots/slot_basics', slot: slot
json.media do
  json.partial! 'v1/media/media_items', media: slot.media_items
end
