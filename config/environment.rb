# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load the app's custom environment variables here,
# so that they are loaded before environments/*.rb
# http://stackoverflow.com/a/11765775/531439
if Rails.env.test? || Rails.env.development?
  app_env_vars = File.join(Rails.root, 'config', 'app_environment_variables.rb')
  load(app_env_vars) if File.exist?(app_env_vars)
end

# some timeslot variables, put them here until we need a better place
VISITOR = 'visitor' # no user is logged-in
STRANGER = 'stranger' # a logged-in but unrelated user
FRIEND = 'friend' # a user with an active friendship with current_user
FOAF = 'foaf' # friend-of-a-friend -> shared friend(s) with current_user
ME = 'me'
PAGINATION_DEFAULT_LIMIT = ENV['PAGINATION_DEFAULT_LIMIT'].try(:to_i) || 40
PAGINATION_MAX_LIMIT = ENV['PAGINATION_MAX_LIMIT'].try(:to_i) || 100
PAGINATION_DEFAULT_FILTER = ENV['PAGINATION_DEFAULT_FILTER'] || 'upcoming'

# Initialize the Rails application.
Rails.application.initialize!
