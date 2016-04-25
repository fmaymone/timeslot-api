json.slot_sets do
  json.slot_groups slot_groups, partial: 'v1/slots/slotgroup', as: :slotgroup
  json.my_calendar my_cal_uuid if my_cal_uuid
  json.my_friend_slots share_with_friends if share_with_friends
end
