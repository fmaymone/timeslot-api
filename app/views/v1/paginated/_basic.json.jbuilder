json.paging do
  json.limit paging_info.limit
  json.status paging_info.status
  json.moment paging_info.moment

  json.before paging_info.data.first.as_paging_cursor
  json.after paging_info.after
  # json.next slots.last.as_paging_cursor
  # json.previous slots.first.as_paging_cursor
end
