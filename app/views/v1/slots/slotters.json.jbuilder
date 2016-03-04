json.array!(@slotters) do |user|
  # json.created_at reslot.created_at
  json.slotter do
    json.partial! 'v1/users/user', user: user
  end
end
