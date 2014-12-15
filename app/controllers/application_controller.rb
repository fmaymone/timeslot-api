class ApplicationController < ActionController::API
  include ActionController::Caching
  include ActionController::Helpers
  helper_method :current_user

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
  # used for setting current user for tests
  def current_user=(user)
    @@hack_current_user = user
  end

  def current_user
    @current_user ||= @@hack_current_user
  end

  # HACK: temporary solution
  # TODO: improve
  # checks if a HTTP AUTHORIZATION header is set
  # if so sets the current user to the user with the provided username
  def sign_in
    # tests use current_user= method
    return if Rails.env.test?

    if request.headers['HTTP_AUTHORIZATION'].nil?
      return render json: "HTTP 'Authorization' header required",
                    status: :unauthorized
    end
    username = request.headers['HTTP_AUTHORIZATION']

    current_user = User.where(username: username).first
    if !current_user.nil?
      @current_user = current_user
    else
      render json: "Authorization error: Couldn't find user with name #{username}",
             status: :unauthorized
    end
  end
end
