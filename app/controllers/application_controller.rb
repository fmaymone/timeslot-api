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

  # HACK: This is not ready for production
  # TODO: add authentication
  def current_user=(user)
    @@current_user = user
  end

  def current_user
    @@current_user ||= nil
  end

  # HACK: temporary solution
  # TODO: improve
  # checks if a HTTP_AUTHORIZATION header is set with the username
  # of the current_user
  # the current_user is set via the
  # authenticate endpoint: GET /v1/users/authenticate/:user_id
  def signed_in?
    # skip authentication in tests for now
    if Rails.env.test?
      return
    end

    if current_user.nil?
      return render json: "Login required", status: :unauthorized
    end

    if request.headers['HTTP_AUTHORIZATION'].nil?
      return render json: "HTTP_AUTHORIZATION header requiered", status: :unauthorized
    end

    if request.headers['HTTP_AUTHORIZATION'] != current_user.username
      return render json: "test", status: :unauthorized
    end
  end
end
