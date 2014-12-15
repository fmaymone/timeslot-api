module V1
  class IosController < ApplicationController
    # GET /v1/ios/clean-db
    def clean_db
      if ENV['ENABLE_IOS_DB_CLEAN']
        DatabaseCleaner.clean
        head :ok
      else
        head :unauthorized
      end
    end
  end
end
