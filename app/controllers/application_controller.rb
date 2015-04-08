class ApplicationController < ActionController::API
  include TS_Authenticable
  include Pundit

  # Enforces access right checks for individuals resources
  after_action :verify_authorized

  # Enforces access right checks for collections
  # after_action :verify_policy_scoped, only: :index

  rescue_from ActiveRecord::RecordNotFound do
    head :not_found
  end

  rescue_from ActiveRecord::StatementInvalid do |exception|
    notify_airbrake(exception)
    render json: { error: exception.message }, status: :unprocessable_entity
  end

  rescue_from ActionController::ParameterMissing do |exception|
    render json: { error: exception.message }, status: :unprocessable_entity
  end

  rescue_from Pundit::NotAuthorizedError do
    head :unauthorized
  end
end
