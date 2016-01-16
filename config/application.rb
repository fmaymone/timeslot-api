require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TsRailsBackend
  class Application < Rails::Application
    # http://blog.arkency.com/2014/11/dont-forget-about-eager-load-when-extending-autoload/
    config.eager_load_paths << Rails.root.join('lib')
    config.eager_load_paths += Dir[Rails.root.join('app', 'models', 'concerns', '**/')]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # Always allow 'format' as request parameter, 'controller' and 'action' are
    # allowed by default.
    # Note: this will return the hash with string keys, not symbol keys. Rails5 ?
    # http://eileencodes.com/posts/actioncontroller-parameters-now-returns-an-object-instead-of-a-hash/
    config.action_controller.always_permitted_parameters = %w( controller action format )
    # config.always_permitted_parameters = %w( controller action format )

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # 'us' is not supported, we have to choose 'en' instead
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en
    # http://guides.rubyonrails.org/i18n.html

    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    # don't log passwords
    config.filter_parameters += [:password]

    # no fractional seconds for datime strings
    # ActiveSupport::JSON::Encoding.time_precision = 0

    # dump postgres specific sql into schema
    config.active_record.schema_format = :sql

    Jbuilder.key_format camelize: :lower

    logger = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))
    # should sucker punch run async?
    if (ENV['INLINE_WORKERS'] == 'true')
      require 'sucker_punch/testing/inline'
      logger.tagged('WORKER') { logger.info { 'workers not ASYNC' } }
    else
      logger.tagged('WORKER') { logger.info { 'workers are ASYNC' } }
    end

    # logger for worker threads from sucker_punch
    # SuckerPunch.logger = Logger.new("#{Rails.root}/log/sucker_punch.log")

    # Enable CORS
    # https://github.com/cyu/rack-cors
    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end

    # Use this global flag to skip sending push notifications
    config.SKIP_PUSH_NOTIFICATION = false

    # Enabling garbage collection instrumentation for NewRelic
    GC::Profiler.enable
  end
end
