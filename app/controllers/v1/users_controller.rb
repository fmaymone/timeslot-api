module V1
  class UsersController < ApplicationController
    skip_before_filter :authenticate_user_from_token!,
                       only: [:create, :signin, :show_slots]

    # GET /v1/users
    def index
      @users = User.all

      render :index
    end

    # GET /v1/users/1/slots
    # method was added for demo purposes
    # def show_slots
    #   user = User.find(params[:id])
    #   @slots = []
    #   @slots.push(*user.std_slots)
    #   @slots.push(*user.re_slots)
    #   @slots.push(*user.group_slots)

    #   render "v1/slots/index"
    # end

    # GET /v1/users/1
    def show
      @user = User.find(params[:id])

      render :show
    end

    # POST /v1/users
    def create
      @user = User.create_with_image(user_params)

      if @user.errors.empty?
        render :show, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # POST /v1/users/signin
    # returns auth_token if correct email and password are send
    def signin
      @user = User.sign_in(*credentials)

      if @user
        render :signin
      else
        render json: { error: "email and password didn't match" },
               status: :unauthorized
      end
    end

    # GET /v1/users/signout
    # invalidates auth token?
    def signout
    end

    # PATCH /v1/users/1
    def update
      @user = current_user.change(user_params) unless user_params.empty?

      if @user.errors.empty?
        render :show
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /v1/users
    def destroy
      @user = current_user

      if @user.inactivate # inactivate methode to be implemented
        render :show
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # POST /v1/users/add_friends
    # TODO: add friendship state to get users json if a friendship exists
    # creates friend request or accepts friend request if one exists
    def add_friends
      friends_params.each do |id|
        offer = current_user.offered_friendship(id)
        if offer
          offer.accept
        elsif current_user.friendship(id).nil?
          current_user.requested_friends << User.find(id)
        end
      end

      head :ok
    end

    # POST /v1/users/remove_friends
    # deny friend request and unfriending
    def remove_friends
      friends_params.each do |id|
        friendship = current_user.friendship(id)
        friendship.inactivate if friendship
      end
    end

    private def user_params
      p = params.permit(:username, :email, :password, :defaultAlerts, :image)
      if params[:image].present?
        img_param = params.require(:image).require(:publicId)
        p.merge!("public_id" => img_param)
      end
      p.transform_keys(&:underscore)
    end

    private def friends_params
      params.require(:ids)
    end

    private def credentials
      [params.require(:email), params.require(:password)]
    end
  end
end
