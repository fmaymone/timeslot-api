# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)

# this doesn't seem to be necessary anymore, duplicates logs atm
# also display logs in console
# if Rails.env.development?
#   console = ActiveSupport::Logger.new(STDOUT)
#   console.formatter = Rails.logger.formatter
#   console.level = Rails.logger.level
#   Rails.logger.extend ActiveSupport::Logger.broadcast console
# end

run Rails.application
