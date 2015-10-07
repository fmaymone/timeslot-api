class StreamJob
  include SuckerPunch::Job
  workers ENV['NOTIFICATION_WORKERS'] || 5

  def perform(connections, params)
    connections.each do |connection|
      begin
        #Device.notify(client, queue, params)
      rescue => e
        # rescuing here has not to much (but some) value bc we already
        # rescue in the device.notify method
        # opts = {}
        # opts[:parameters] = {
        #   user_id: queue['user_id'],
        #   device_id: queue['id'],
        #   sucker_punch: "push notification failed" }
        # Rails.logger.error e
        # Airbrake.notify(e, opts)
      end
    end
  end

  # def perform_later(sec, devices, params)
  #   after(sec) { perform(devices, params) }
  # end
end
