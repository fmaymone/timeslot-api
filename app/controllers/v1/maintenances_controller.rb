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

    # GET /v1/maintenance/clean-db
    def clean_db
      if !Rails.env.production? && (ENV['ENABLE_IOS_DB_CLEAN'] == 'true')
        DatabaseCleaner.clean
        head :ok
      else
        head :unauthorized
      end
    end
  end
end
