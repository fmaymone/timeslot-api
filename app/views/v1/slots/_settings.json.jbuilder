json.settings do
  json.alerts slot.alerts(current_user) if current_user
end
