module V1
  class ConnectsController < ApplicationController
    skip_before_action :authenticate_user_from_token!
    skip_after_action :verify_authorized

    # POST /v1/fb-connect
    def facebook_connect
      provider = Provider.find_by name: 'facebook'
      ip = identity_params.merge(provider: provider)
      social_connect([ip, facebook_params])
    end

    # POST /v1/tw-connect
    def twitter_connect

    end

    private def social_connect(data)
      if current_user
        social_merge_or_connect(data)
      else
        social_signup_or_signin(data)
      end
    end

    private def social_signup_or_signin(data)
      @user = User.create_or_signin_via_social(*data)

      if @user.errors.any?
        render json: { error: @user.errors.messages },
               status: :unprocessable_entity
      elsif @user
        render 'v1/users/signup'
      else
        render json: {
                 error: "couldn't find or create user for given credentials" },
               status: :unauthorized
      end
    end

    private def social_merge_or_connect(data)
      current_user.connect_or_merge(*data)

      if current_user.errors.any?
        render json: { error: current_user.errors.messages },
               status: :unprocessable_entity
      else
        @user = current_user
        render 'v1/users/show'
      end
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
