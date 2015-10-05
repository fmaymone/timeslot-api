json.partial! 'v1/paginated/basic', paging_info: @result
json.data @result.data do |slot|
  json.partial! 'v1/slots/slot', slot: slot
  json.url v1_slot_url(slot, format: :json)
end
