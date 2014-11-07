class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do
    head :not_found
  end

  rescue_from ActiveRecord::StatementInvalid do |exception|
    render json: { pgerror: exception.message }, status: :unprocessable_entity
  end

  rescue_from ActionController::ParameterMissing do |exception|
    render json: { error: exception.message }, status: :unprocessable_entity
  end

  def current_user
    @current_user ||= User.first
  end
end
