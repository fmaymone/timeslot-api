class Device < ActiveRecord::Base
  after_commit AuditLog

  belongs_to :user

  validates :user, presence: true
  validates :device_id, presence: true
  validates :system, presence: true
  validates :version, presence: true
  validates :push, presence: true, inclusion: [true, false]

  def self.detect_or_create(user, system: nil, version: nil, device_id: nil)
    return if device_id.nil? || system.nil? || version.nil?
    device = find_by(device_id: device_id) if device_id
    device || create(user: user,
                     system: system,
                     version: version,
                     device_id: device_id)
  end

  def register_endpoint(token, push: true)
    return if token.nil? || endpoint
    case system
    when 'ios'
      sns_endpoint = register_endpoint_ios(token)
    else
      sns_endpoint = nil
    end
    if sns_endpoint
      endpoint_registered = Device.where(endpoint: sns_endpoint)
      if endpoint_registered.empty?
        update(user: user,
               token: token,
               endpoint: sns_endpoint,
               push: push)
      else
        # set new timestamp to updated_at
        endpoint_registered[0].touch(:updated_at)
      end
    end
  end

  private def register_endpoint_ios(token)
    begin
      Aws::SNS::Client.new.create_platform_endpoint(
          platform_application_arn:
              ENV['AWS_PLATFORM_APPLICATION_ARN'],
          token:
              token,
          #TODO: what we will do with this attributes?
          attributes: {} #{ 'UserId' => user.id.to_s }
      )[:endpoint_arn]
    rescue Aws::SNS::Errors::ServiceError => exception
      Rails.logger.error exception
      Airbrake.notify(aws_sns_error: exception)
      raise exception if Rails.env.test? || Rails.env.development?
    end
  end

  def unregister_endpoint
    if endpoint
      begin
        Aws::SNS::Client.new.delete_endpoint({ endpoint_arn: endpoint })
        update_columns({endpoint: '', push: false})
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
  private def notify_ios(sns, message:, alert: '', sound: 'default', badge: 1, extra: {a: 1, b: 2})
    begin
      sns.publish(target_arn: endpoint, message: {
        default: message,
        APNS_SANDBOX: {
            aps: {
                alert: alert, sound: sound, badge: badge, extra: extra
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
