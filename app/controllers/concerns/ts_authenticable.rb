module TS_Authenticable
  def self.included(base)
    base.include ActionController::HttpAuthentication::Token::ControllerMethods
    base.include ActionController::Caching
    base.include ActionController::Helpers
    base.before_action :authenticate_user_agent
    base.before_action :authenticate_user_from_token!
    base.helper_method :current_user
  end

  def current_user
    @current_user || authenticate_token
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

  def authenticate_user_agent
    if Rails.env.production?
      if not request.user_agent.match(/iPad|iPhone|iPod/)
        render json: 'request not authorized, error: 57', status: :forbidden
        # no special reason for 57, just to be able to identify the msg
      end
    end
  end
end
