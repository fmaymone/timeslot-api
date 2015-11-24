module V1
  class UsersController < ApplicationController
    skip_before_action :authenticate_user_from_token!, except: :show

    # GET /v1/users/1
    def show
      authorize :user
      @user = User.find(params[:id])

      render :show
    end

    # POST /v1/users
    def create
      authorize :user
      @user = User.create_with_device(params: user_create_params,
                                      device: device_params(params[:device]))
      if @user.errors.empty?
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
      requested_user = User.find(params[:user_id])

      collector = SlotsCollector.new(**slot_paging_params)
      @slots = collector.user_slots(current_user: current_user,
                                    user: requested_user)

      if slot_paging_params.blank?
        render "v1/slots/index"
      else
        @result = SlotPaginator.new(data: @slots, **slot_paging_params)
        render "v1/paginated/slots"
      end
    end

    # GET /v1/users/1/media
    # get all media items of the given user
    def media_items
      authorize :user

      target_user = User.find(params[:user_id])
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
      params.permit(:username, :email, :phone, :password, :lang)
    end

    private def device_params(params)
      return nil unless params && params[:deviceId].present?
      params.permit(:deviceId, :system, :version, :token, :endpoint)
        .transform_keys(&:underscore)
        .symbolize_keys
    end

    private def credentials
      params.require(:password)
      params.require(:email) unless params[:phone].present?
      params.require(:phone) unless params[:email].present?
      params.permit(:email, :phone, :password,
                    device: [:deviceId, :system, :version, :token])
        .deep_transform_keys(&:underscore)
        .deep_symbolize_keys
    end
  end
end
