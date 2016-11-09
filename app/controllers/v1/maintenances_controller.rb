module V1
  class MaintenancesController < ApplicationController
    skip_before_action :authenticate_user_from_token!
    skip_after_action :verify_authorized

    # health check route for AWS
    # GET /v1/maintenance
    def health
      head :ok
    end

    # GET /v1/maintenance/clientversions
    def clientversions
      render 'v1/maintenances/versions'
    end
  end
end
