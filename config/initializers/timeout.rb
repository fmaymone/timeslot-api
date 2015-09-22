if Rails.env.production?
  timeout_seconds = ENV['RACK_TIMEOUT'].nil? ? 15 : ENV['RACK_TIMEOUT'].to_i
  Rack::Timeout.timeout = timeout_seconds
else
  Rack::Timeout.timeout = 0
end
