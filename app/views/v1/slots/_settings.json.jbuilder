json.settings do
  json.alerts current_user.alerts(slot) if current_user
end
