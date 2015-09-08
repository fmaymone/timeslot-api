require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TsRailsBackend
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join('lib')

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # 'us' is not suppoerted, we have to choose 'en' instead
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en
    # http://guides.rubyonrails.org/i18n.html

    # don't log passwords
    config.filter_parameters += [:password]

    # no fractional seconds for datime strings
    # ActiveSupport::JSON::Encoding.time_precision = 0

    # dump postgres specific sql into schema
    config.active_record.schema_format = :sql

    Jbuilder.key_format camelize: :lower

    # logger for worker threads from sucker_punch
    SuckerPunch.logger = Logger.new("#{Rails.root}/log/sucker_punch.log")
  end
end
