module V1
  class UsersController < ApplicationController
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
    def update
      @user = User.find(params[:id])

      if @user.update(user_create_params)
        head :no_content
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /v1/users/1
    def destroy
      @user = User.find(params[:id])

      if SoftDeleteService.call(@user)
        # render :show
        head :no_content
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    private def user_create_params
      params.require(:user).permit(:username)
    end
  end
end
