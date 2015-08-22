class Device < ActiveRecord::Base
  after_commit AuditLog

  belongs_to :user, inverse_of: :devices

  validates :user, presence: true
  validates :device_id, presence: true, uniqueness: true
  validates :system, presence: true
  validates :version, presence: true

  def register_endpoint(token)
    return false if token.nil?
    # check if token already exist on an old device
    if(device = Device.find_by(token: token)) && device != self
      self.token = token
      self.endpoint = device[:endpoint] if device[:endpoint]
      self.save
      device.destroy
    end
    return nil if endpoint && token == self.token
    # sets new endpoint if not exist or update if new token was passed
    case system
    when 'ios'
      endpoint_arn = register_endpoint_ios(token)
    else
      endpoint_arn = nil
    end
    update(token: token, endpoint: endpoint_arn) if endpoint_arn
  end

  def unregister_endpoint
    if endpoint
      begin
        Device.create_client.delete_endpoint({ endpoint_arn: endpoint })
      rescue Aws::SNS::Errors::ServiceError => exception
        Rails.logger.error exception
        Airbrake.notify(aws_sns_error: exception)
        errors.add(:unregister_endpoint, "could not unregister endpoint")
        raise exception if Rails.env.test? || Rails.env.development?
      ensure
        update(endpoint: nil)
      end
    end
  end

  def notify(client, params)
    case system
    when 'ios'
      notify_ios(client, *params)
    end
  end

  # delete if user deactivates his profile
  def delete
    update(deleted_at: Time.zone.now)
    ts_soft_delete
  end

  private def register_endpoint_ios(token)
    begin
      Device.create_client.create_platform_endpoint(
          platform_application_arn: ENV['AWS_PLATFORM_APPLICATION_IOS'],
          token: token)[:endpoint_arn]
    rescue Aws::SNS::Errors::ServiceError => exception
      Rails.logger.error exception
      Airbrake.notify(aws_sns_error: exception)
      errors.add(:register_endpoint, "could not register endpoint")
      raise exception if Rails.env.test? || Rails.env.development?
    end
  end

  # push notification to APNS (apple push notification service)
  private def notify_ios(client, message:, alert: '', sound: 'default',
                         badge: 1, extra: {a: 1, b: 2})
    begin
      client.publish(target_arn: endpoint, message: {
          default: message,
          APNS_SANDBOX: {
              aps: {
                  alert: alert, sound: sound,
                  badge: badge, extra: extra
              }
          }
      }.to_json, message_structure: "json")
    rescue Aws::SNS::Errors::ServiceError => exception
      Rails.logger.error exception
      Airbrake.notify(aws_sns_error: exception)
      errors.add(:client, "could not send push notification to device")
    end
  end

  def self.create_client
    # this client will be overridden by a stub for rspec testings
    Aws::SNS::Client.new
  end

  def self.notify_all(users, params)
    # we using worker background processing to start request tasks asynchronously
    NotifyJob.new.async.perform(users, params)
  end

  def self.update_or_create(params)
    return if params.nil?
    device = find_or_create_by(device_id: params[:device_id])
    device.update(params.extract!(:user_id, :device_id, :system, :version))
    if params[:endpoint] === false
      device.unregister_endpoint
    elsif params[:token]
      device.register_endpoint(params[:token])
    end
  end
end
