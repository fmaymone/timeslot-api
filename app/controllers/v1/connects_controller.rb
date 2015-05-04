module V1
  class ConnectsController < ApplicationController
    skip_before_action :authenticate_user_from_token!
    skip_after_action :verify_authorized

    # POST /v1/fb-connect
    def facebook_connect
      identity = Connect.find_by social_id: identity_params[:social_id]

      if identity
        @user = identity.user
      else
        @user = User.create(params.permit(:username))
        return unless @user.errors.empty?
        @user.set_auth_token

        identity = Connect.create(user: @user, provider_id: 0,
                                  social_id: identity_params[:social_id],
                                  data: facebook_params)
        # there shouldn't be anything which could go wrong here...
        fail "couldn't create identity" if identity.errors.any?
      end

      if @user
        render 'v1/users/signup'
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
