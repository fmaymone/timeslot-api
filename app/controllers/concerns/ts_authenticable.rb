module TS_Authenticable
  def self.included(base)
    base.include ActionController::HttpAuthentication::Token::ControllerMethods
    base.include ActionController::Caching
    base.include ActionController::Helpers
    base.before_filter :authenticate_user_from_token!
    base.helper_method :current_user
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
    headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: 'Bad credentials', status: :unauthorized
  end
end
