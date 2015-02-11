Airbrake.configure do |config|
  config.api_key = '60a29489047b4ca377db98a076bd38d7'
  config.user_attributes = [:id, :username]

  # notify all error types:
  # config.ignore_only = []

  # enable airbrake for dev environment:
  # set config.consider_all_requests_local to false in development.rb
  # config.development_environments = []
end
