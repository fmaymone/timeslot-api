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
    p Rails.env
    p request.user_agent
    p request.user_agent.match(/iPad|iPhone|iPod/)
    unless Rails.env.development? || request.user_agent.match(/iPad|iPhone|iPod/) #change to 'if Rails.env.production?'
      render json: 'enviroment or user_agent is not authorized', status: :forbidden
    end
  end
end
