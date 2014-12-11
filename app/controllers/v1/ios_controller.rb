module V1
  class IosController < ApplicationController
    # GET /clean-db
    def clean_db
      if Rails.env.apptest? || Rails.env.test?
        DatabaseCleaner.clean
        head :ok
      else
        head :unauthorized
      end
    end
  end
end
