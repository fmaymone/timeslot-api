module V1
  class MeController < ApplicationController
    # GET /v1/me
    def show
      authorize :user
      @user = current_user

      render :show
    end
  end
end
