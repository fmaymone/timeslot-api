# frozen_string_literal: true
# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load the app's custom environment variables here,
# so that they are loaded before environments/*.rb
# http://stackoverflow.com/a/11765775/531439
if Rails.env.test? || Rails.env.development?
  app_env_vars = File.join(Rails.root, 'secret-configs', 'app_environment_variables.rb')
  load(app_env_vars) if File.exist?(app_env_vars)
# also use this on aws to load env vars from S3
# works in conjunction with .ebextensions/database.config
elsif Rails.env.production?
  app_env_vars = File.join('/tmp', 'app_environment_variables.rb')
  load(app_env_vars) if File.exist?(app_env_vars)
end

# some timeslot variables, put them here until we need a better place
# user relations
VISITOR = 'visitor'.freeze # no user is logged-in
STRANGER = 'stranger'.freeze # a logged-in but unrelated user
FRIEND = 'friend'.freeze # a user with an active friendship with current_user
FOAF = 'foaf'.freeze # friend-of-a-friend -> shared friend(s) with current_user
ME = 'me'.freeze

# friendships
OFFERED = '00'.freeze
ESTABLISHED = '11'.freeze
REJECTED = '01'.freeze

PAGINATION_DEFAULT_LIMIT = ENV['PAGINATION_DEFAULT_LIMIT'].try(:to_i) || 40
# PAGINATION_MAX_LIMIT = ENV['PAGINATION_MAX_LIMIT'].try(:to_i) || 101
PAGINATION_MAX_LIMIT = ENV.fetch('PAGINATION_MAX_LIMIT', 100).to_i
PAGINATION_DEFAULT_FILTER = ENV.fetch('PAGINATION_DEFAULT_FILTER', 'none')
PAGINATION_DEFAULT_MODE = ENV.fetch('PAGINATION_DEFAULT_MODE', 'all')

# Initialize the Rails application.
Rails.application.initialize!
