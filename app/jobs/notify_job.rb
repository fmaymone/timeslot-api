class NotifyJob
  include SuckerPunch::Job
  workers ENV['NOTIFICATION_WORKERS'] || 5

  def perform(user_queue, params)
    Rails.logger.warn {
      "SUCKER_PUNCH NotifyJob started. Notifying #{user_queue.length} users..."
    }
    client = Device.create_client
    # currently it is not possible to bulk multiple notifications into one
    # request to AWS SNS
    # to handle multiple notifications we need topics and subscriber but this
    # mess things up, cuz we would need to mirror the most of the logic from
    # backend into an "AWS-topic-model"
    # https://forums.aws.amazon.com/thread.jspa?messageID=639931#639931
    user_queue.each do |user|
      user['queue'].each do |device|
        begin
          Device.notify(client, device, user['lang'], params)
        rescue => e
          # rescuing here has not to much (but some) value bc we already
          # rescue in the device.notify method
          opts = {}
          opts[:parameters] = {
            user_id: device['user_id'],
            device_id: device['id'],
            sucker_punch: "push notification failed" }
          Rails.logger.error { e }
          Airbrake.notify(e, opts)
        end
      end
      Rails.logger.warn {
        "SUCKER_PUNCH NotifyJob done. (#{user_queue.length} users notifyed)"
      }
    end
  end

  # def perform_later(sec, devices, params)
  #   after(sec) { perform(devices, params) }
  # end
end
