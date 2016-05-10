class NewUser
  def initialize(user_params: params, device_params: nil)
    @user_params = user_params
    @device_params = device_params
  end

  def create_new_user
    new_user = User.create(@user_params)
    return new_user unless new_user.errors.empty?

    if new_user.basic? || new_user.public_user?
      create_device(new_user: new_user, device: @device_params) if @device_params
      create_default_calendars(user: new_user)
    end
    new_user
  end

  # TODO: refactor this from user model
  # def create_or_signin_via_social(identity_params, social_params)
  #   identity = Connect.find_by(social_id: identity_params[:social_id],
  #                              provider: identity_params[:provider])
  #   if identity
  #     no_token = identity.user.auth_token.nil?
  #     identity.user.update(auth_token: generate_auth_token) if no_token
  #     create_device(new_user: identity.user, device: device) if device
  #     return identity.user
  #   else
  #     new_user = detect_or_create(identity_params[:username],
  #                                 social_params[:email])
  #     return new_user unless new_user.errors.empty?
  #     new_user.update(auth_token: generate_auth_token) unless new_user.auth_token
  #     create_device(new_user: new_user, device: device) if device

  #     identity = Connect.create(user: new_user,
  #                               provider: identity_params[:provider],
  #                               social_id: identity_params[:social_id],
  #                               data: social_params)

  #     new_user.errors.add(connect: identity.errors) if identity.errors.any?
  #     new_user
  #   end
  # end

  def create_default_calendars(user:)
    private_cal_uuid = user.slot_sets['my_private_slots_uuid']
    public_cal_uuid = user.slot_sets['my_public_slots_uuid']

    private_group = Group.find_or_create_by(uuid: private_cal_uuid) do |calendar|
      calendar.owner = user
      calendar.name = 'Private'
      calendar.public = false
      calendar.description = 'Slots are visible only to you.'
    end

    return private_group unless private_group.errors.empty?

    public_group = Group.find_or_create_by(uuid: public_cal_uuid) do |calendar|
      calendar.owner = user
      calendar.name = 'Public'
      calendar.public = true
      calendar.description = 'Slots are visible for everybody.'
    end

    return public_group unless public_group.errors.empty?

    true
  end

  private def create_device(new_user:, device:)
    Device.update_or_create(new_user, device)
  end

  # # Issue to be decided upon later but for now we keep this behaviour:
  # # If there is a timeslot account with an unverified email address and another
  # # user tries to log in with facebook and has this email verified in facebook,
  # # the other user can not log in via facebook (gets 422)
  # private def detect_or_create(username, email)
  #   user = User.find_by email: email if email
  #   if user
  #     msg = "#{email} is already used by other timeslot user (unverified email)"
  #     Airbrake.notify(msg)
  #     fail ActiveRecord::StatementInvalid, msg unless user.email_verified
  #   end
  #   user || User.create(username: username, email: email)
  # end

  private

  attr_reader :user_params, :device
end
