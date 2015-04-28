module V1
  class ConnectsController < ApplicationController
    skip_before_action :authenticate_user_from_token!
    skip_after_action :verify_authorized

    # POST /v1/fb-connect
    def facebook_connect
      pp params
      binding.pry

      @identity = Identity.find(params.require(:social_id))

      unless @identity
        @identity = Identity.create(params)
        User.create()
      end
    end

    # POST /v1/tw-connect
    def twitter_connect

    end
  end
end
