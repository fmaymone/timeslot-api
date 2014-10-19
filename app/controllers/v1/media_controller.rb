module V1
  class MediaController < ApplicationController
    rescue_from CloudinaryException do |exception|
      render json: exception.message, status: :service_unavailable
    end

    # GET /v1/media
    def create_signature
      @signature = cloudinary_signature

      render :show, status: :created
    end

    private def cloudinary_signature
      timestamp = Time.zone.now.strftime('%Y%m%d%H%M%S')
      public_id = Cloudinary::Utils.random_public_id
      params_to_sign = { public_id: public_id, timestamp: timestamp }
      Cloudinary::Utils.sign_request(params_to_sign)
    end
  end
end
