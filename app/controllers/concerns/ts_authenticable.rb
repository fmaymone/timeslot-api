module TSAuthenticable
  include TSErrors

  def self.included(base)
    base.include ActionController::HttpAuthentication::Token::ControllerMethods
    base.include ActionController::Caching
    base.include ActionController::Helpers
    base.before_action :authenticate_user_from_token!
    base.helper_method :current_user
  end

  def current_user
    @current_user || authenticate_token
  end

  private def authenticate_user_from_token!
    fail MissingCurrentUserError unless authenticate_token
  end

  private def authenticate_token
    authenticate_with_http_token do |token, options|
      @current_user = User.find_by(auth_token: token)
    end
  end
end
