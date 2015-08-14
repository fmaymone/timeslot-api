class Device < ActiveRecord::Base
  after_commit AuditLog

  belongs_to :user

  validates :user, presence: true
  validates :device_id, presence: true
  validates :system, presence: true
  validates :version, presence: true
  validates :push, presence: true, inclusion: [true, false]

  def self.detect_or_create(user, device_id:, system:, version:)
    device = find_by(device_id: device_id)
    if device
      device.update(user: user)
    else
      create(user: user,
             system: system,
             version: version,
             device_id: device_id)
    end
  end

  def update_device(params)
    update_columns(
      params.extract!(:deviceId,
                      :system,
                      :version,
                      :push).transform_keys{ |key| key.to_s.underscore }
    )
    if params[:endpoint] == false
      unregister_endpoint
    elsif params[:token]
      register_endpoint(params[:token])
    end
  end

  def register_endpoint(token)
    return if token.nil?
    case system
    when 'ios'
      sns_endpoint = register_endpoint_ios(token)
    else
      sns_endpoint = nil
    end
    if sns_endpoint
      update_columns({ token: token, endpoint: sns_endpoint })
    end
  end

  private def register_endpoint_ios(token)
    begin
      Aws::SNS::Client.new.create_platform_endpoint(
          platform_application_arn: ENV['AWS_PLATFORM_APPLICATION_ARN'],
          token: token,
          #TODO: pass here custom parameters to the notification
          attributes: {} #{ 'UserId' => user.id.to_s }
      )[:endpoint_arn]
    rescue Aws::SNS::Errors::ServiceError => exception
      Rails.logger.error exception
      Airbrake.notify(aws_sns_error: exception)
      raise exception if Rails.env.test? || Rails.env.development?
    end
  end

  def unregister_endpoint
    unless endpoint.empty?
      begin
        Aws::SNS::Client.new.delete_endpoint({ endpoint_arn: endpoint })
        update_columns({ endpoint: '', push: false })
      rescue Aws::SNS::Errors::ServiceError => exception
        Rails.logger.error exception
        Airbrake.notify(aws_sns_error: exception)
        raise exception if Rails.env.test? || Rails.env.development?
      end
    end
  end

  def notify(params)
    case system
    when 'ios'
      notify_ios(Aws::SNS::Client.new, *params)
    end
  end

  # push notification to APNS (apple push notification service)
  private def notify_ios(sns, message:, alert: '', sound: 'default',
                         badge: 1, extra: {a: 1, b: 2})
    begin
      sns.publish(target_arn: endpoint, message: {
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
      raise exception if Rails.env.test? || Rails.env.development?
    end
  end

  # delete if user deactivates his profile
  def delete
    unregister_endpoint
    update_columns({ deleted_at: Time.zone.now })
  rescue => err
    Rails.logger.error err
    Airbrake.notify(err)
  ensure
    ts_soft_delete
  end
end
