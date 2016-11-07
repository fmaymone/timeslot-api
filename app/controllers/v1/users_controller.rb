module V1
  class UsersController < ApplicationController
    skip_before_action :authenticate_user_from_token!,
                       except: [:show, :friends, :create_public]

    # GET /v1/users/1
    def show
      authorize :user
      user = User.find(params[:id])
      friendship = user.friendship(current_user)

      collector = SlotsCollector.new(mode: 'upcoming', limit: 4)
      slots = collector.user_preview_slots(current_user: current_user,
                                           user: user)

      render :show, locals: { user: user, friendship: friendship, slots: slots }
    end

    # POST /v1/users
    def create
      authorize :user
      params.delete(:role)
      create_user
    end

    # POST /v1/users_public
    def create_public
      authorize :user

      if !params[:role].in? %w(public_user)
        render json: { error: 'invalid user role' },
               status: :unprocessable_entity
      elsif current_user.email.nil?
        render json: { error: 'no email available for this user' },
               status: :forbidden
      else
        copy_user_password = params[:password].nil?
        params[:email] = current_user.email
        params[:username] ||= current_user.username
        params[:password] ||= SecureRandom.urlsafe_base64(8)
        create_user(public_user: true, copy_password: copy_user_password)
      end
    end

    private def create_user(public_user: false, copy_password: false)
      service = NewUser.new(user_params: user_create_params,
                            device_params: device_params(params[:device]))
      @user = service.create_new_user

      if public_user && copy_password
        @user.update(auth_token: current_user.auth_token,
                     password_digest: current_user.password_digest)
      end

      if @user.errors.empty?
        @current_user = @user
        render :signup, status: :created
      else
        render json: { error: @user.errors },
               status: :unprocessable_entity
      end
    end

    # POST /v1/users/signin
    # returns auth_token if correct email and password are send
    def signin
      authorize :user
      @user = User.sign_in(credentials)

      if @user
        @current_user = @user
        render :signup
      else
        render json: { error: "email and password didn't match" },
               status: :unauthorized
      end
    end

    # POST /v1/users/reset
    # resets password to a new random password which is sent per email
    def reset_password
      authorize :user
      @user = User.find_by! email: params.require(:email)
      @user.reset_password

      head :ok
    end

    # GET /v1/users/1/slots
    # returns all slots of the requested user visible for the current user
    def slots
      authorize :user
      requested_user = User.find(params[:id])

      collector = SlotsCollector.new(**slot_paging_params)
      the_result = collector.user_slots(current_user: current_user,
                                        user: requested_user)
      @slots = the_result.data

      if slot_paging_params.blank?
        render "v1/slots/index"
      else
        @result = SlotPaginator.new(data: the_result, **slot_paging_params)
        render "v1/paginated/slots"
      end
    end

    # GET /v1/users/1/calendars
    # returns public calenders and non-public calenders where user and
    # current_user are member
    def calendars
      authorize :user
      user = User.find(params[:id])

      calendar_service = CalendarCollector.new(current_user)
      @groups = calendar_service.calendars_for(user)

      render "v1/groups/index"
    end

    # GET /v1/users/1/dates
    # returns a list of all dates where the slots of this user start
    def dates
      authorize :user
      user = User.find(params[:id])

      collector = DatesCollector.new(current_user: current_user,
                                     timezone: params[:timezone])
      @dates = collector.user_slot_dates(user: user)

      render "v1/slots/dates"
    end

    # GET /v1/users/1/friends
    # returns all friends of a user
    def friends
      requested_user = User.find(params[:id])
      authorize requested_user
      @users = requested_user.friends

      render "v1/users/list"
    end

    # GET /v1/users/1/media
    # get all media items of the given user
    def media_items
      authorize :user

      target_user = User.find(params[:id])
      collector = MediaCollector.new(current_user: current_user,
                                     other_user: target_user)
      @media_items = collector.retrieve

      render "v1/media/index"
    end

    private def user_create_params
      params.require(:email) unless params[:phone].present?
      params.require(:phone) unless params[:email].present?
      params.require(:password)
      params.require(:username)
      params.delete(:role) unless params[:role].in? %w(public_user)
      params.permit(:username, :first_name, :middle_name, :last_name,
                    :email, :phone, :password, :lang, :role, :gender)
    end

    private def device_params(params)
      return nil unless params && params[:device_id].present?
      params.permit(:device_id, :system, :version, :token, :endpoint)
        .symbolize_keys
    end

    private def credentials
      params.require(:password)
      params.require(:email) unless params[:phone].present?
      params.require(:phone) unless params[:email].present?
      params.delete(:role) unless params[:role].in? %w(public_user)
      params.permit(:email, :phone, :password, :role,
                    device: [:device_id, :system, :version, :token])
        .deep_symbolize_keys
    end
  end
end
