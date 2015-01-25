module V1
  class UsersController < ApplicationController
    # before_filter :signed_in?, except: [:auth, :create]
    before_filter :sign_in, except: [:auth, :create, :index, :show_slots]

    # GET /v1/users
    def index
      @users = User.all

      render :index
    end

    # HACK: temporary no current user
    # GET /v1/users/1/slots
    # TODO: needs admin layer, comment out method
    def show_slots
      user = User.find(params[:id])
      @slots = []
      @slots.push(*user.std_slots)
      @slots.push(*user.re_slots)
      @slots.push(*user.group_slots)

      render "v1/slots/index"
    end

    # GET /v1/users/1
    def show
      @user = User.find(params[:id])

      render :show
    end

    # GET /v1/users/authenticate/1
    # HACK: temporary solution
    def auth
      user = User.find(params[:id])
      self.current_user = user

      head :ok
    end

    # POST /v1/users
    def create
      @user = User.add(user_params)

      # if @user.save

      if @user.errors.empty?
        render :show, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /v1/users/1
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
      parameter = params.permit(:username, :email, :defaultAlerts, :image)
      parameter.merge!("public_id" => image_param) if params[:image].present?
      parameter.transform_keys(&:underscore)
    end

    private def friends_params
      params.require(:ids)
    end

    private def image_param
      params.require(:image).require(:publicId)
    end
  end
end
