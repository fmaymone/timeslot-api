Airbrake.configure do |config|
  config.api_key = '60a29489047b4ca377db98a076bd38d7'
  config.ignore_only = []
  config.development_environments = []
  config.user_attributes = [:id, :username] # ["id"] also works
end
