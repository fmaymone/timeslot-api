if share_id.empty?
  json.share_url nil
else
  json.share_url "#{ENV['TS_SLOT_WEBSHARING_URL']}#{share_id}"
end
