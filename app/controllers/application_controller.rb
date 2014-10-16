class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do
    head :not_found
  end

  rescue_from ActiveRecord::StatementInvalid do |exception|
    render json: exception.message, status: :unprocessable_entity
  end
end
