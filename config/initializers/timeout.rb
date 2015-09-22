if Rails.env.production?
  Rack::Timeout.timeout = ENV['RACK_TIMEOUT'] || 15
else
  Rack::Timeout.timeout = 0
end
