if Rails.env.production?
  timeout_seconds = ENV['RACK_TIMEOUT'] || 15
  Rack::Timeout.timeout = timeout_seconds
else
  Rack::Timeout.timeout = 0
end
