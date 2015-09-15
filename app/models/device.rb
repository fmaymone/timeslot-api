class Device < ActiveRecord::Base
  after_commit AuditLog

  belongs_to :user, inverse_of: :devices

  validates :user, presence: true
  validates :device_id, presence: true
  validates :system, presence: true
  validates :version, presence: true

  def register_endpoint(token)
    return false if token.nil?
    # check if token already exist on an old device
    if(device = Device.find_by(token: token)) && device != self
      self.token = token
      self.save
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
  private def notify_ios(client, message:, alert: '', sound: 'receive_message.wav',
                         badge: 1, extra: {a: 1, b: 2}, slot_id: "")

    payload = {}
    # defaults to true, if ENV variable not set, otherwise examine
    if ENV['PUSH_DEFAULT'].nil? ? true : ENV['PUSH_DEFAULT'] == 'true'
      payload.merge!(default: { message: message })
    end

    if ENV['PUSH_APNS'].nil? ? true : ENV['PUSH_APNS'] == 'true'
      payload.merge!({ APNS: { aps: {
                                 alert: message,
                                 sound: sound,
                                 badge: badge,
                                 slot_id: slot_id
                               }
                             }.to_json })
    end

    if ENV['PUSH_APNS_SANDBOX'].nil? ? true : ENV['PUSH_APNS_SANDBOX'] == 'true'
      payload.merge!({ APNS_SANDBOX: { aps: {
                                         alert: message,
                                         sound: sound,
                                         badge: badge,
                                         slot_id: slot_id
                                       }
                                     }.to_json })
    end
    push_notification = { message: payload.to_json,
                          target_arn: endpoint,
                          message_structure: 'json' }

    # push_notification = { message: {
    #                         default: {
    #                           message: message
    #                         },
    #                         APNS: {
    #                           aps: {
    #                             alert: message,
    #                             sound: sound,
    #                             badge: badge,
    #                             slot_id: slot_id
    #                           }
    #                         }.to_json,
    #                         APNS_SANDBOX: {
    #                           aps: {
    #                             alert: message,
    #                             sound: sound,
    #                             badge: badge,
    #                             slot_id: slot_id
    #                           }
    #                         }.to_json
    #                       }.to_json,
    #                       target_arn: endpoint,
    #                       message_structure: 'json' }

    begin

      # For testing purposes only:
      # out_message = {:message=>message}
      # apns_string = {}
      # apns_string[:aps] = {:alert => message, :sound => sound, :badge => badge, :slot_id => slot_id}
      # aws_message = {:default => out_message, :APNS_SANDBOX => apns_string.to_json, :APNS => apns_string.to_json}
      # client.publish :message => aws_message.to_json, :target_arn => endpoint, :message_structure => 'json'
      client.publish(push_notification)

    rescue Aws::SNS::Errors::ServiceError => exception
      opts = { error_message: "AWS SNS Service Error (#{exception.class.name})" }
      opts[:params] = { user_id: user_id,
                        device_id: id,
                        aws_params: exception.params,
                        aws_operation_name: exception.operation_name,
                        aws_http_request: exception.http_request,
                        aws_http_response: exception.http_response,
                        aws_sns_error: exception }
      Rails.logger.error opts
      Rails.logger.error exception
      Airbrake.notify(exception, opts)
      # I'm not sure if we ever evaluate the following line
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

  def self.update_or_create(user, params)
    return if params.nil?
    device = Device.find_by(device_id: params[:device_id]) ||
             Device.create(params.extract!(:device_id, :system, :version))
    device.update(user: user)
    device.update(params)
    if params[:endpoint] === false
      device.unregister_endpoint
    elsif params[:token]
      device.register_endpoint(params[:token])
    end
  end
end
