module V1
  class IosController < ApplicationController
    # GET /v1/ios/clean-db
    def clean_db
      p ENV['ENABLE_IOS_DB_CLEAN']
      p ENV['ENABLE_IOS_DB_CLEAN'].class

      if ENV['ENABLE_IOS_DB_CLEAN'] == 'true'
        DatabaseCleaner.clean
        head :ok
      else
        head :unauthorized
      end
    end
  end
end
