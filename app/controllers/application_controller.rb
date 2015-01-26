class ApplicationController < ActionController::API
  include ActionController::Caching
  include ActionController::Helpers
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_filter :authenticate_user_from_token!
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

  def current_user
    @current_user
  end

  private def authenticate_user_from_token!
    authenticate_token || render_unauthorized
  end

  private def authenticate_token
    authenticate_with_http_token do |token, options|
      @current_user = User.find_by(auth_token: token)
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: 'Bad credentials', status: 401
  end
end
