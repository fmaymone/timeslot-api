class ApplicationController < ActionController::API
  include TSAuthenticable
  include Pundit

  # Enforces access right checks for individuals resources
  after_action :verify_authorized
  after_action :set_locale, only: :users

  rescue_from ParameterInvalid, with: :unprocessable_entity
  rescue_from PaginationError, with: :unprocessable_entity
  rescue_from DuplicateEntry, with: :unprocessable_entity
  rescue_from ActionController::ParameterMissing, with: :unprocessable_entity

  rescue_from ActiveRecord::RecordNotFound do |e|
    if Rails.env.production?
      head :not_found
    else
      render json: { error: e.message }, status: :not_found
    end
  end

  rescue_from ActiveRecord::StatementInvalid do |exception|
    Airbrake.notify(exception, current_user: current_user, params: params)
    render json: { error: exception.message }, status: :unprocessable_entity
  end

  rescue_from Pundit::NotAuthorizedError do |e|
    # abuse Airbrake to learn more about the system
    Airbrake.notify(e, current_user: current_user, params: params)

    if e.query == 'update_metaslot?' || e.policy.class == GroupPolicy
      head :forbidden
    else
      head :not_found # obscure the fact that the resource actually exists
    end
  end

  rescue_from MissingCurrentUserError do
    # headers['Authorization'] = 'Token token="auth_token"'
    render json: { error: 'auth_token invalid or missing' },
           status: :unauthorized
  end

  rescue_from DataTeamServiceError do |exception|
    Airbrake.notify(exception, current_user: current_user, params: params)
    render json: { error: exception.message }, status: :service_unavailable
  end

  # GET /
  def root
    head :unauthorized
  end

  private def unprocessable_entity(exception)
    render json: { error: exception.message }, status: :unprocessable_entity
  end

  private def visibility
    return nil unless params.key? :visibility

    visibility = params[:visibility]
    valid_values = %w(private friends foaf public)

    unless valid_values.include? visibility
      raise ActionController::ParameterMissing,
           "visibility must be one of #{valid_values}"
    end
    visibility
  end

  private def add_to_slotgroup(slot, group_uuid)
    group = Group.find_by!(uuid: group_uuid)
    # TODO: I need different auth-checks for different slot types
    authorize group, :add_slot?
    SlotsetManager.new(current_user: current_user).add!(slot, group)
  rescue ActiveRecord::RecordNotFound,
         Pundit::NotAuthorizedError,
         TSErrors::SlotGroupDeleted
    slot.errors.add(:base, group_uuid)
  end

  private def add_to_slotsets(slot, slot_sets)
    special_sets = current_user.slot_sets.invert

    slot_sets.each do |slot_set|
      if special_sets.key? slot_set
        case special_sets[slot_set]
        when 'my_cal_uuid', 'my_friend_slots_uuid'
          SlotsetManager.new(current_user: current_user).add!(slot, slot_set)
        when 'my_public_slots_uuid', 'my_private_slots_uuid'
          # for this uuids a real group exists
          calendar = Group.find_by uuid: slot_set
          SlotsetManager.new(current_user: current_user).add!(slot, calendar)
        end
      else
        add_to_slotgroup(slot, slot_set)
      end
    end
  end

  private def slot_paging_params
    p = params.permit(:mode, :limit, :moment,
                      :filter, :earliest, :latest,
                      :after, :before).symbolize_keys

    # are there any pagination params?
    return {} unless p.any?

    # set default limit if not provided
    p[:limit] = PAGINATION_DEFAULT_LIMIT if p[:limit].nil?
    # set maximum for limit to 100 if higher
    p[:limit] = PAGINATION_MAX_LIMIT if p[:limit].to_i > PAGINATION_MAX_LIMIT

    # if 'between' filter is used require earliest & latest and set default mode
    if p[:filter].present? && p[:filter] == 'between'
      params.require(:earliest)
      params.require(:latest)
      p[:mode] = 'now' if p[:mode].nil?
      p[:moment] = p[:earliest] if p[:moment].nil?
    # ignore mode & moment if a cursor is submitted
    elsif p[:before].present? || p[:after].present?
      p[:mode] = nil
      p[:moment] = nil
    else
      # set default mode and moment if not provided
      p[:mode] = PAGINATION_DEFAULT_MODE if p[:mode].nil?
      p[:moment] = Time.zone.now.to_s if p[:moment].nil?
    end
    p
  end

  # I18n
  private def set_locale
    I18n.locale = current_user ? current_user.lang || 'en' : I18n.default_locale
  end
end
