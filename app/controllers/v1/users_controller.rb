module V1
  class UsersController < ApplicationController
    before_filter :signed_in?, except: [:auth, :create]

    # GET /v1/users
    def index
      @users = User.all

      render :index
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
      @user = User.new(user_create_params)

      if @user.save
        render :show, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /v1/users/1
    # TODO check for current user, can only update his own stuff
    def update
      @user = current_user

      if image_param.present? && AddImage.call(@user, user_image_param).equal?(true)
        render "v1/media/create",
               status: :created,
               locals: { media_item_id: @user.image.first.id }
      elsif !image_param.present? && @user.update(user_create_params)
        render :show, status: :no_content
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /v1/users
    def destroy
      @user = current_user

      if @user.delete
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
        connection = current_user.friendship(id)
        connection.delete if connection
      end
    end

    private def user_create_params
      params.require(:user).permit(:username)
    end

    private def friends_params
      params.require(:ids)
    end

    private def image_param
      params.require(:user)[:newMedia]
    end

    private def user_image_param
      params.require(:user).require(:newMedia).require(:public_id)
    end
  end
end
