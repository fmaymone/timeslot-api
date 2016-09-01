class ImportJob
  include SuckerPunch::Job
  workers ENV['NOTIFICATION_WORKERS'] || 5

  def perform(events, current_user, group)
    Rails.logger.warn {
      "SUCKER_PUNCH ImportJob started (User: #{current_user[:id]}, Group: #{group})"
    }
    ActiveRecord::Base.connection_pool.with_connection do
      Import.handler(events, current_user, group)
    end
  rescue => e
      opts = {
        user: current_user[:id],
        group: group,
        sucker_punch: "import file failed"
      }
      Rails.logger.error { e }
      Airbrake.notify(e, opts)
      puts e
  ensure
    ActiveRecord::Base.clear_active_connections!
    Rails.logger.warn {
      "SUCKER_PUNCH ImportJob done (User: #{current_user[:id]}, Group: #{group})"
    }
  end
end
