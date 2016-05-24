# https://github.com/brandonhilkert/sucker_punch
SuckerPunch.exception_handler { |ex| Airbrake.notify(ex) }

# Logger for worker threads from sucker_punch
# SuckerPunch.logger = Logger.new("#{Rails.root}/log/sucker_punch.log")

# Setup default queue adapter for active jobs
Rails.application.configure do
  config.active_job.queue_adapter = :sucker_punch
  config.active_job.queue_name_prefix = Rails.env
  config.active_job.queue_name_delimiter = '.'
end
