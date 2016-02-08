json.slot_sets do
  json.slot_groups slot_groups, partial: 'v1/slots/slotgroup', as: :slotgroup
  json.my_calendar my_cal_uuid if my_cal_uuid
end
