class ApplicationController < ActionController::API
  include TS_Authenticable
  include Pundit

  # Raised when the value of a parameter is invalid.
  class ParameterInvalid < StandardError
    def initialize(param, value)
      super("#{value} is not a valid value for param: #{param}")
    end
  end

  # Raised when the pagination cursor is not valid anymore (usually because
  # slot.start_date or slot.end_date has changed since encoding).
  class PaginationError < StandardError
    def initialize
      super("invalid cursor")
    end
  end

  # Enforces access right checks for individuals resources
  after_action :verify_authorized
  after_action :set_locale, only: :users

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

  rescue_from ParameterInvalid do |exception|
    render json: { error: exception.message }, status: :unprocessable_entity
  end

  rescue_from PaginationError do |exception|
    render json: { error: exception.message }, status: :unprocessable_entity
  end

  private def slot_paging_params
    p = params.permit(:status, :moment, :limit, :after, :before).symbolize_keys

    # are there any pagination params?
    return {} unless p.any?

    # set default limit if not provided
    p[:limit] = 40 if p[:limit].nil?
    # set maximum for limit to 100 if higher
    p[:limit] = 100 if p[:limit].to_i > 100

    # ignore status & moment if a cursor is submitted
    if p[:before].present? || p[:after].present?
      p[:status] = nil
      p[:moment] = nil
    else
      # set default status and moment if not provided
      p[:status] = 'upcoming' if p[:status].nil?
      p[:moment] = Time.zone.now.to_s if p[:moment].nil?
    end
    p
  end

  # for Pundit
  class UserContext
    attr_reader :current_user, :requested_user

    def initialize(current_user, requested_user = nil)
      @current_user = current_user
      @requested_user = requested_user
    end
  end

  def pundit_user
    if params[:user_id].present?
      requested_user = User.find(params[:user_id])
      UserContext.new(current_user, requested_user)
    else
      current_user
    end
  end

  # I18n
  def set_locale
    I18n.locale = (current_user[:lang] || I18n.default_locale)
  end
end
