# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'

# measure test coverage
# using this in conjunction with spring gives wrong results and makes testruns
# slower, because of this, coverage is only measured on demand by running:
# DISABLE_SPRING=true rspec
if ENV['DISABLE_SPRING']
  puts 'measuring test coverage'
  require 'simplecov'
  SimpleCov.start 'rails'
end

require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'shoulda/matchers'
require "pundit/rspec"

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  # config.infer_spec_type_from_file_location!

  config.before(:each) do
    # Disable triggering activities by default
    allow_any_instance_of(FeedJob).to receive(:perform).and_return(nil)
  end

  config.before(:each, :activity) do
    # Enable triggering activities
    allow_any_instance_of(FeedJob).to receive(:perform).and_call_original
  end

  config.after(:each, :activity) do
    # Disable triggering activities after it was enabled
    allow_any_instance_of(FeedJob).to receive(:perform).and_return(nil)
  end

  # to be able to use route helpers in specs
  config.include Rails.application.routes.url_helpers
  Rails.application.routes.default_url_options[:host] = 'example.org'
end

# shoulda 3.0 needs this type of config
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    # Choose a test framework:
    with.test_framework :rspec
    # with.test_framework :minitest
    # with.test_framework :minitest_4
    # with.test_framework :test_unit

    # Choose one or more libraries:
    with.library :active_record
    with.library :active_model
    # with.library :action_controller
    # Or, choose the following (which implies all of the above):
    # with.library :rails
  end
end
