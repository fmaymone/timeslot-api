class NotifyJob
  include SuckerPunch::Job
  workers ENV['NOTIFICATION_WORKERS'] || 5

  def perform(users, params)
    ActiveRecord::Base.connection_pool.with_connection do
      client = Device.create_client
      # currently it is not possible to bulk multiple notifications into one
      # request to AWS SNS
      # to handle multiple notifications we need topics and subscriber but this
      # mess things up, cuz we would need to mirror the most of the logic from
      # backend into an "AWS-topic-model"
      # https://forums.aws.amazon.com/thread.jspa?messageID=639931#639931
      User.where(id: users.uniq).find_each do |user|
        next if !user.push || user.deleted_at?

        user.devices.each do |device|
          begin
            device.notify(client, params) if device.endpoint
          rescue => e
            msg = { user_id: user.id, device_id: device.id }
            msg.merge!(sucker_punch: "creating push notification for #{user.username} failed.")
            msg.merge!(aws_sns_error: e)
            Rails.logger.error msg
            Airbrake.notify msg
            raise exception if Rails.env.test? || Rails.env.development?
          end
        end
      end
    end
  end

  # def perform_later(sec, devices, params)
  #   after(sec) { perform(devices, params) }
  # end
end
