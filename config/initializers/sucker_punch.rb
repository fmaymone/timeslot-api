# https://github.com/brandonhilkert/sucker_punch
SuckerPunch.exception_handler { |ex| Airbrake.notify(ex) }

Rails.application.configure do
  config.active_job.queue_adapter = :sucker_punch
end
