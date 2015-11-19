class ApplicationController < ActionController::API
  include TS_Authenticable
  include Pundit

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

  rescue_from Pundit::NotAuthorizedError do |e|
    # abuse Airbrake to learn more about the system
    notify_airbrake(e)

    # pp e.record.class
    # pp e.policy.class
    # pp e.query

    # TODO: this is work-in-progress (BKD-328)
    if e.query == 'update_metaslot?' || e.policy.class == GroupPolicy
      head :forbidden
    else
      head :not_found # obscure the fact that the resource actually exists
    end
  end

  rescue_from ParameterInvalid do |exception|
    render json: { error: exception.message }, status: :unprocessable_entity
  end

  rescue_from PaginationError do |exception|
    render json: { error: exception.message }, status: :unprocessable_entity
  end

  rescue_from MissingCurrentUserError do
    # headers['Authorization'] = 'Token token="auth_token"'
    render json: 'Invalid or missing auth_token', status: :unauthorized
  end

  private def slot_paging_params
    p = params.permit(:filter, :moment, :limit, :after, :before).symbolize_keys

    # are there any pagination params?
    return {} unless p.any?

    # set default limit if not provided
    p[:limit] = PAGINATION_DEFAULT_LIMIT if p[:limit].nil?
    # set maximum for limit to 100 if higher
    p[:limit] = PAGINATION_MAX_LIMIT if p[:limit].to_i > PAGINATION_MAX_LIMIT

    # ignore status & moment if a cursor is submitted
    if p[:before].present? || p[:after].present?
      p[:filter] = nil
      p[:moment] = nil
    else
      # set default status and moment if not provided
      p[:filter] = PAGINATION_DEFAULT_FILTER if p[:filter].nil?
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

  # I18n
  def set_locale
    I18n.locale = (current_user[:lang] || I18n.default_locale)
  end
end
