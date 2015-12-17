class Device < ActiveRecord::Base
  include Channel

  after_commit AuditLog

  belongs_to :user, inverse_of: :devices

  validates :user, presence: true
  validates :device_id, presence: true
  validates :system, presence: true
  validates :version, presence: true

  #scope :active_sockets, -> { where.not(socket: nil) }

  def register_endpoint(token)
    return false if token.nil?
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
    update(token: token, endpoint: endpoint_arn) if endpoint_arn
  end

  def unregister_endpoint
    if endpoint
      begin
        Device.create_client.delete_endpoint({ endpoint_arn: endpoint })
      rescue Aws::SNS::Errors::ServiceError => exception
        Rails.logger.error { exception }
        Airbrake.notify(exception)
        errors.add(:unregister_endpoint, "could not unregister endpoint")
        raise exception if Rails.env.test? || Rails.env.development?
      ensure
        update(endpoint: nil)
      end
    end
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
    Rails.logger.error { exception }
    Airbrake.notify(exception)
    errors.add(:register_endpoint, "could not register endpoint")
    raise exception if Rails.env.test? || Rails.env.development?
  end

  # push notification to APNS (apple push notification service)
  def self.notify_ios(client, device, lang, message:, alert: '', sound: 'receive_message.wav',
                      badge: 1, extra: {a: 1, b: 2}, slot_id: nil, user_id: nil, friend_id: nil)
    Rails.logger.warn { "SUCKER_PUNCH Notify IOS device #{device['id']} started." }

    has_custom_language = lang.present? && lang != I18n.default_locale

    if message.try(:KEY).present?
      I18n.locale = lang if has_custom_language
      message = I18n.t(message[:KEY], message.except(:KEY))
      I18n.locale = I18n.default_locale if has_custom_language
      # Default language fallback if custom language fails
      message = I18n.t(message[:KEY], message.except(:KEY)) if has_custom_language && message.nil?
    end

    # Skip sending if no message exist
    return if message.nil? || message.blank?

    payload = {}
    aps = {
        alert: message,
        sound: sound,
        badge: badge
    }
    aps[:slot_id] = slot_id if slot_id
    aps[:user_id] = user_id if user_id
    aps[:friend_id] = friend_id if friend_id

    # defaults to true, if ENV variable not set, otherwise examine
    if ENV['PUSH_DEFAULT'].nil? || ENV['PUSH_DEFAULT'] == 'true'
      payload.merge!(default: { message: message })
    end

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
