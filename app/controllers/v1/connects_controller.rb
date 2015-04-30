module V1
  class ConnectsController < ApplicationController
    skip_before_action :authenticate_user_from_token!
    skip_after_action :verify_authorized

    # POST /v1/fb-connect
    def facebook_connect
      # pp params

      @identity = Connect.find_by social_id: identity_params[:social_id]
      # binding.pry

      unless @identity
        # User.create(username: params.require(:name))
        new_user = User.create(params.permit(:username))
        return unless new_user.errors.empty?


        @identity = Connect.create(user: new_user, provider_id: 0,
                                   social_id: identity_params[:social_id])
        # there shouldn't be anything which could go wrong here...

        fail "couldn't create identity" if @identity.errors.any?
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
  end
end
