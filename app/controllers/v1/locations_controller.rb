module V1
  require 'open-uri'

  class LocationsController < ApplicationController
    skip_before_action :authenticate_user_from_token!
    skip_after_action :verify_authorized

    # GET /v1/locations/search?q=berghain&limit=20&pos=13.0,52.0
    def search
      search_url = ENV['TS_LOCATION_SEARCH_SERVICE_URL']
      user = ENV['TS_LOCATION_SEARCH_SERVICE_NAME']
      pw = ENV['TS_LOCATION_SEARCH_SERVICE_PASSWORD']
      query_string = request.env["QUERY_STRING"] if location_search_params

      query = "#{search_url}?#{query_string}"
      auth = { http_basic_authentication: [user, pw] }

      begin
        # WebMock.allow_net_connect!  # for local testing
        result = open(query, auth).read
        # WebMock.disable_net_connect!
      rescue => e
        Airbrake.notify(e)
        return render json: "Search Service Error: #{e}", status: :ok
      end
      render json: result, status: :ok
    end

    private def location_search_params
      params.require(:q)
    end
  end
end
