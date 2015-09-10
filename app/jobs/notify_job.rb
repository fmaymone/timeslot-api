class NotifyJob
  include SuckerPunch::Job
  workers 2

  def perform(users, params)
    ActiveRecord::Base.connection_pool.with_connection do
      client = Device.create_client
      # currently it is not possible to bulk multiple notifications into one request to AWS SNS
      # to handle multiple notifications we need topics and subscriber but this mess things up, cuz
      # we would need to mirror the most of the logic from backend into an "AWS-topic-model"
      # https://forums.aws.amazon.com/thread.jspa?messageID=639931#639931
      User.where(id: users).find_each do |user|
        if user.push && user.deleted_at.nil?
          user.devices.find_each do |device|
            device.notify(client, params) if device.endpoint
          end
        end
      end
    end
  rescue Exception => exception
    Rails.logger.error exception
    raise exception if Rails.env.test? || Rails.env.development?
  end

  # def perform_later(sec, devices, params)
  #   after(sec) { perform(devices, params) }
  # end
end
