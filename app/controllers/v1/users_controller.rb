module V1
  class UsersController < ApplicationController
    skip_before_action :authenticate_user_from_token!,
                       only: [:create, :signin, :reset_password]
    skip_after_action :verify_authorized, only: :slots
    after_action :verify_policy_scoped, only: :slots

    # GET /v1/users
    def index
      authorize :user
      @users = User.all

      render :index
    end

    # GET /v1/users/1
    def show
      authorize :user
      @user = User.find(params[:id])

      render :show
    end

    # POST /v1/users
    def create
      authorize :user
      @user = User.create_with_image(user_params)

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
      @user = User.sign_in(*credentials)

      if @user
        render :signup
      else
        render json: { error: "email and password didn't match" },
               status: :unauthorized
      end
    end

    # GET /v1/users/signout
    # invalidates auth token
    def signout
      authorize :user
      current_user.sign_out

      head :ok
    end

    # POST /v1/users/reset
    # resets password to a new random password, should be sent per email
    # TODO: this is not ready for production, sets a default password until
    # we have email integration
    def reset_password
      authorize :user
      @user = User.find_by email: params.require(:email)
      @user.reset_password

      head :ok
    end

    # PATCH /v1/users/1
    def update
      authorize :user
      @user = current_user.update_with_image(user_params) unless user_params.empty?

      if @user.errors.empty?
        render :show
      else
        render json: { error: @user.errors },
               status: :unprocessable_entity
      end
    end

    # DELETE /v1/users
    def destroy
      authorize :user
      # user inactivate methode not yet fully implemented
      @user = current_user.inactivate

      if @user.errors.empty?
        render :show
      else
        render json: { error: @user.errors },
               status: :unprocessable_entity
      end
    end

    # GET /v1/users/1/slots
    def slots
      @slots = policy_scope(:slot)

      render "v1/slots/index"
    end

    # GET /v1/users/friendslots
    # This is weird and not nice, pundit scopes seem way to inflexible...
    # the 'resolve' method for SlotPolicy is already used by 'slots' method
    # using another name doesn't trigger 'performed' for the scoped policy
    # while the business logic is now in the policy instead of the model,
    # the instantiation of the policy is ugly as shit
    def slots_from_friends
      authorize :user

      ctx = UserContext.new(current_user, nil)
      @slots = SlotPolicy::Scope.new(ctx, BaseSlot).friend_slots

      render "v1/slots/index"
    end

    # POST /v1/users/add_friends
    # creates friend request or accepts friend request if one exists
    def add_friends
      authorize :user
      current_user.add_friends friends_ids

      head :ok
    end

    # POST /v1/users/remove_friends
    # deny friend request and unfriending
    def remove_friends
      authorize :user
      current_user.remove_friends friends_ids

      head :ok
    end

    private def user_params
      p = params.permit(:username,
                        :email,
                        :password,
                        :image,
                        :defaultPrivateAlerts,
                        :defaultOwnFriendslotAlerts,
                        :defaultOwnPublicAlerts,
                        :defaultFriendsFriendslotAlerts,
                        :defaultFriendsPublicAlerts,
                        :defaultReslotAlerts,
                        :defaultGroupAlerts)

      if params[:image].present?
        img_param = params.require(:image).require(:publicId)
        p.merge!("public_id" => img_param)
      end
      p.transform_keys(&:underscore)
    end

    private def friends_ids
      params.require(:ids)
    end

    private def credentials
      [params.require(:email), params.require(:password)]
    end
  end
end
