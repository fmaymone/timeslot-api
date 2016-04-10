class ImportJob
  include SuckerPunch::Job
  workers ENV['NOTIFICATION_WORKERS'] || 5

  def perform(events, current_user, group)
    Rails.logger.warn {
      "SUCKER_PUNCH ImportJob started (User: #{current_user[:id]}, Group: #{group})"
    }
    begin
      Import.handler(events, current_user, group)
    rescue => e
      opts = {
        user: current_user[:id],
        group: group,
        sucker_punch: "import file failed"
      }
      Rails.logger.error { e }
      Airbrake.notify(e, opts)
    end
    Rails.logger.warn {
      "SUCKER_PUNCH ImportJob done (User: #{current_user[:id]}, Group: #{group})"
    }
  end

  # def perform_later(sec, devices, params)
  #   after(sec) { perform(devices, params) }
  # end
end
