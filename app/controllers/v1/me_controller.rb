module V1
  class MeController < ApplicationController
    # GET /v1/me
    def show
      authorize :user
      @user = current_user

      render :show
    end

    # GET /v1/me/signout
    # invalidates auth token
    def signout
      authorize :user
      current_user.sign_out

      head :ok
    end
  end
end
