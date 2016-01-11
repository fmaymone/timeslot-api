class Device < ActiveRecord::Base
  include Channel

  after_commit AuditLog

  belongs_to :user, inverse_of: :devices

  validates :user, presence: true
  validates :device_id, presence: true
  validates :system, presence: true
  validates :version, presence: true

  #scope :active_sockets, -> { where.not(socket: nil) }

  # Mobile token management with Amazon SNS:
  # http://mobile.awsblog.com/post/Tx223MJB0XKV9RU/Mobile-token-management-with-Amazon-SNS

  def register_endpoint(token)
    return if token.nil?

    # check if token already exist on an old device
    if (device = Device.find_by(token: token)) && device != self
      self.token = token
      save!
      device.destroy
    end

    # sets new endpoint if not exist or update if new token was passed
    case system
    when 'ios'
      endpoint_arn = register_endpoint_ios(token)
    else
      endpoint_arn = nil
    end

    # unregister endpoint if it was disabled
    if endpoint_arn
      update(token: token, endpoint: endpoint_arn)
    else
      unregister_endpoint
    end
  end

  def unregister_endpoint
    return unless endpoint

    Device.create_client.delete_endpoint(endpoint_arn: endpoint)
  rescue Aws::SNS::Errors::ServiceError => exception
    Airbrake.notify(exception, endpoint_arn: endpoint)

    if Rails.env.test? || Rails.env.development?
      raise exception
    else
      Rails.logger.error { exception }
      errors.add(:unregister_endpoint, "could not unregister endpoint")
    end
  ensure
    update(endpoint: nil)
  end

  # delete if user deactivates his profile
  def delete
    update(deleted_at: Time.zone.now)
    ts_soft_delete
  end

  private def register_endpoint_ios(token)
    Device.create_client.create_platform_endpoint(
      platform_application_arn: ENV['AWS_PLATFORM_APPLICATION_IOS'],
      token: token)[:endpoint_arn]
  rescue Aws::SNS::Errors::ServiceError => exception
    Airbrake.notify(exception, token: token)

    if Rails.env.test? || Rails.env.development?
      raise exception
    else
      Rails.logger.error { exception }
      errors.add(:register_endpoint, "could not register endpoint")
    end
  end

  # push notification to APNS (apple push notification service)
  def self.notify_ios(client, device, lang, message:, sound: 'receive_message.wav',
                      badge: 1, extra: {}, slot_id: nil, user_id: nil, friend_id: nil)
    Rails.logger.warn { "SUCKER_PUNCH Notify IOS device #{device['id']} started." }

    has_custom_language = lang.present? && lang != I18n.default_locale

    unless message[:KEY].nil?
      I18n.locale = lang if has_custom_language
      message_push = I18n.t(message[:KEY], message.except(:KEY))
      if has_custom_language
        I18n.locale = I18n.default_locale
        # Default language fallback if custom language fails
        message_push ||= I18n.t(message[:KEY], message.except(:KEY))
      end
    else
      message_push = nil
    end

    # Skip sending if no message exist
    return if message_push.nil? || message_push.blank?

    aps = {
      alert: message_push,
      sound: sound,
      badge: badge,
      extra: extra
    }
    aps[:slot_id] = slot_id if slot_id
    aps[:user_id] = user_id if user_id
    aps[:friend_id] = friend_id if friend_id

    # Always includes the default message
    payload = {default: { message: message_push }}

    if ENV['PUSH_APNS'].nil? || ENV['PUSH_APNS'] == 'true'
      payload.merge!(APNS: { aps: aps }.to_json)
    end

    if ENV['PUSH_APNS_SANDBOX'].nil? || ENV['PUSH_APNS_SANDBOX'] == 'true'
      payload.merge!(APNS_SANDBOX: { aps: aps }.to_json)
    end

    push_notification = { message: payload.to_json,
                          target_arn: device['endpoint'],
                          message_structure: 'json' }
    begin
      client.publish(push_notification)
    rescue Aws::SNS::Errors::InvalidParameter => exception
      Rails.logger.warn { "Target ARN: No endpoint found. Endpoint was removed from users device." }
      device = Device.find(device['id']).unregister_endpoint
      Airbrake.notify(exception, news: 'endpoint removed from AWS SNS',
                      reason: 'invalid parameter',
                      device: device)
    rescue Aws::SNS::Errors::EndpointDisabled => exception
      # maybe also remove the device here?
      Rails.logger.warn {
        "AWS SNS Error: Endpoint (#{device.endpoint}) for device " \
        "(ID: #{device.id}) disabled. Removing it..."
      }
      device = Device.find(device['id']).unregister_endpoint
      Airbrake.notify(exception, news: 'endpoint removed from AWS SNS',
                      reason: 'endpoint disabled',
                      device: device)
    rescue Aws::SNS::Errors::ServiceError => exception
      Rails.logger.error { exception }
      opts = { error_message: "AWS SNS Service Error (#{exception.class.name})" }
      opts[:parameters] = { user_id: device['user_id'],
                            device_id: device['id'],
                            aws_params: exception.try(:params) || exception.try(:parameters),
                            aws_operation_name: exception.try(:operation_name),
                            aws_http_request: exception.try(:http_request),
                            aws_http_response: exception.try(:http_response),
                            aws_sns_error: exception }
      Rails.logger.error { opts }
      Airbrake.notify(exception, opts)
    end
    Rails.logger.warn { "SUCKER_PUNCH Notify IOS device #{device['id']} done." }
  end

  def self.create_client
    # this client will be overridden by a stub for rspec testings
    Aws::SNS::Client.new
  end

  def self.notify(client, device, lang, params)
    case device['system']
    when 'ios'
      notify_ios(client, device, lang, params)
    end
  end

  def self.notify_all(user_ids, params)
    user_queue = []

    User.where(id: user_ids, push: true, deleted_at: nil).uniq.find_each do |user|
      device_queue = []
      user.devices.where.not(endpoint: nil).find_in_batches do |devices|
        device_queue.concat(devices)
      end
      user_queue << { lang: user.lang || 'en', queue: device_queue }.as_json if device_queue.any?
    end
    # Start worker job asynchronously
    NotifyJob.new.async.perform(user_queue, params) if user_queue.any?
  end

  def self.update_or_create(user, params)
    return if params.nil?

    device = Device.find_by(device_id: params[:device_id]) ||
             Device.create(params.extract!(:device_id, :system, :version))

    device.update(user: user)
    device.update(params)

    if params[:endpoint] == false
      device.unregister_endpoint
    elsif params[:token]
      device.register_endpoint(params[:token])
    end
  end
end
