if Rails.env.production?
  Rack::Timeout.timeout = 5
else
  Rack::Timeout.timeout = 0
end
