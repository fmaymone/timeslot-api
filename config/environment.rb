# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load the app's custom environment variables here,
# so that they are loaded before environments/*.rb
# http://stackoverflow.com/a/11765775/531439
app_env_vars = File.join(Rails.root, 'config', 'app_environment_variables.rb')
load(app_env_vars) if File.exist?(app_env_vars)

# Initialize the Rails application.
Rails.application.initialize!
