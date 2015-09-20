json.array!(@slot.reslots) do |reslot|
  json.created_at reslot.created_at
  json.slotter do
    json.partial! 'v1/users/user', user: reslot.slotter
  end
end
