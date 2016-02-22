module V1
  class ConnectsController < ApplicationController
    skip_before_action :authenticate_user_from_token!
    skip_after_action :verify_authorized

    # POST /v1/fb-connect
    def facebook_connect
      social_connect('facebook', facebook_params)
    end

    # POST /v1/tw-connect
    def twitter_connect
      social_connect('twitter', twitter_params)
    end

    private def social_connect(provider_name, social_params)
      provider = Provider.find_by name: provider_name
      ip = identity_params.merge(provider: provider)

      if current_user
        social_merge_or_connect([ip, social_params])
      else
        social_signup_or_signin([ip, social_params])
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
        render 'v1/users/show', locals: { user: current_user }
      end
    end

    private def identity_params
      params.require(:social_id)
      params.require(:username)
      params.permit(:social_id, :username)
    end

    private def facebook_params
      params.permit(:first_name, :last_name, :middle_name, :gender, :link,
                    :locale, :timezone, :updated_at, :verified, :email, :token)
    end

    private def twitter_params
      params.permit(:auth_token, :auth_secret)
    end
  end
end
