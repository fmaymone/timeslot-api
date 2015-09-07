if Rails.env.production?
  Rack::Timeout.timeout = 15
else
  Rack::Timeout.timeout = 0
end
