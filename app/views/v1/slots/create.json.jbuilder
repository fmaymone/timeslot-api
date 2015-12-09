# this template is rendered for slot creation and deletion
json.partial! 'v1/slots/slot', slot: slot

# here we want to show the slot and reslot counter for the actor (current_user)

# overriding the already rendered creator/slotter json
if slot.class <= StdSlot
  json.creator do
    json.partial! 'v1/users/full_user', user: current_user
  end
elsif slot.class <= ReSlot
  json.slotter do
    json.partial! 'v1/users/full_user', user: current_user
  end
end
