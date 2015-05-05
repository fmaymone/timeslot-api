module V1
  class ConnectsController < ApplicationController
    skip_before_action :authenticate_user_from_token!
    skip_after_action :verify_authorized

    # POST /v1/fb-connect
    def facebook_connect
      if current_user
        current_user.connect_or_merge(identity_params, facebook_params)
      else
        @user = User.create_or_signin_via_social(identity_params, facebook_params)
      end

      if @user
        render 'v1/users/signup'
      elsif current_user
        @user = current_user
        render 'v1/users/show'
      else
        render json: {
                 error: "couldn't find or create user for given credentials" },
               status: :unauthorized
      end
    end

    # POST /v1/tw-connect
    def twitter_connect

    end

    private def identity_params
      params.require(:socialId)
      params.require(:username)
      p = params.permit(:socialId, :username)
      p.transform_keys { |key| key.underscore.to_sym }
    end

    private def facebook_params
      params.permit(:first_name, :last_name, :middle_name, :gender, :link,
                    :locale, :timezone, :updated_at, :verified, :email, :token)
    end
  end
end
