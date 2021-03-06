Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # The test environment is used exclusively to run your application's
  # test suite. You never need to work with it otherwise. Remember that
  # your test database is "scratch space" for the test suite and is wiped
  # and recreated between test runs. Don't rely on the data there!
  config.cache_classes = true

  # FIX: Circular dependency detected while autoloading constant Feed (RuntimeError)
  # http://stackoverflow.com/questions/18013055/circular-dependency-detected-while-autoloading-constant-user
  # config.reload_classes_only_on_change = false

  # Do not eager load code on boot. This avoids loading your whole application
  # just for the purpose of running a single test. If you are using a tool that
  # preloads Rails for running tests, you may have to set it to true.
  config.eager_load = false

  # Configure static asset server for tests with Cache-Control for performance.
  # config.serve_static_files = true
  # simple_cov wants this to be set to false
  config.serve_static_files = false
  config.static_cache_control = 'public, max-age=3600'

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Raise exceptions instead of rendering exception templates.
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment.
  config.action_controller.allow_forgery_protection = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :test

  # Print deprecation notices to the stderr.
  config.active_support.deprecation = :stderr

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Remove the Rack::Lock middleware
  # config.middleware.delete Rack::Lock

  # opt-in into new Rails behaviour
  config.active_record.raise_in_transactional_callbacks = true

  # raise exception when hitting deprecation warning
  ActiveSupport::Deprecation.behavior = :raise

  # let Rails.logger print to console in tests
  config.logger = Logger.new(STDOUT)
  log_level = ENV.fetch('LOG_LEVEL', 'ERROR').upcase.to_sym
  config.log_level = log_level
end
