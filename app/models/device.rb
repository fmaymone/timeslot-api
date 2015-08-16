class Device < ActiveRecord::Base
  after_commit AuditLog

  belongs_to :user

  validates :user, presence: true
  validates :device_id, presence: true, uniqueness: true
  validates :system, presence: true
  validates :version, presence: true

  def self.create_client
    Aws::SNS::Client.new
  end

  def self.detect_or_create(user, params)
    # prevent saving of unknown devices
    return nil if params[:device_id].nil?
    # the device_id is an unique serial from the hardware (uuid) and
    # could change if the user re-install the app
    if (device = find_by(device_id: params[:device_id]))
      # different users can login on the same device (gradual)
      device.update(user: user)
    else
      # users can use multiple devices at the same time (simultaneously)
      device = create(user: user,
                      system: params[:system],
                      version: params[:version],
                      device_id: params[:device_id])
    end
    device
  end

  def update_device(params)
    update(params.extract!(:device_id,
                           :system,
                           :version))
    if params[:endpoint] === false
      unregister_endpoint
    elsif params[:token]
      register_endpoint(params[:token])
    end
  end

  def register_endpoint(token)
    return if token.nil?
    # check if token already exist on an old device
    if(device = Device.find_by(token: token)) && device != self
      self.token = token
      self.endpoint = device[:endpoint] if device[:endpoint]
      self.save
      device.destroy
    end
    # sets new endpoint if not exist
    if endpoint.nil?
      case system
      when 'ios'
        endpoint_arn = register_endpoint_ios(token)
      else
        endpoint_arn = nil
      end
      if endpoint_arn
        update(token: token, endpoint: endpoint_arn)
      end
    end
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
    if user.push && endpoint
      case system
      when 'ios'
        notify_ios(client, *params)
      end
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

  # delete if user deactivates his profile
  def delete
    update(deleted_at: Time.zone.now)
    unregister_endpoint
    ts_soft_delete
  end
end
