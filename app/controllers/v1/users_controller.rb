module V1
  class UsersController < ApplicationController
    skip_before_action :authenticate_user_from_token!,
                       only: [:create, :signin, :reset_password, :media_items]
    skip_after_action :verify_authorized, only: :slots
    after_action :verify_policy_scoped, only: :slots

    # GET /v1/users
    def index
      authorize :user
      @users = User.all

      render :index
    end

    # GET /v1/users/1
    def show
      authorize :user
      @user = User.find(params[:id])

      render :show
    end

    # POST /v1/users
    def create
      authorize :user
      @user = User.create_with_image(params: user_create_params,
                                     image: user_image)
      if @user.errors.empty?
        render :signup, status: :created
      else
        render json: { error: @user.errors },
               status: :unprocessable_entity
      end
    end

    # POST /v1/users/signin
    # returns auth_token if correct email and password are send
    def signin
      authorize :user
      @user = User.sign_in(credentials)

      if @user
        render :signup
      else
        render json: { error: "email and password didn't match" },
               status: :unauthorized
      end
    end

    # GET /v1/users/signout
    # invalidates auth token
    def signout
      authorize :user
      current_user.sign_out

      head :ok
    end

    # POST /v1/users/reset
    # resets password to a new random password, should be sent per email
    # TODO: this is not ready for production, sets a default password until
    # we have email integration
    def reset_password
      authorize :user
      @user = User.find_by email: params.require(:email)
      @user.reset_password

      head :ok
    end

    # PATCH /v1/users/1
    def update
      authorize :user

      # move this into pundit
      if params[:password].present?
        password = params.require(:old_password)
        pw_correct = current_user == current_user.try(:authenticate, password)
        return head :unauthorized unless pw_correct
      end

      @user = current_user.update_with_image(params: user_params,
                                             image: user_image,
                                             user: current_user)

      if @user.errors.empty?
        render :show
      else
        render json: { error: @user.errors },
               status: :unprocessable_entity
      end
    end

    # DELETE /v1/users
    def destroy
      authorize :user
      # user inactivate methode not yet fully implemented
      @user = current_user.inactivate

      if @user.errors.empty?
        render :show
      else
        render json: { error: @user.errors },
               status: :unprocessable_entity
      end
    end

    # GET /v1/users/1/slots
    # returns all slots for this user
    def slots
      @slots = policy_scope(:slot)

      render "v1/slots/index"
    end

    # GET /v1/users/1/slots/now
    # Supports pagination.
    # Returns all currently active slots (startdate before Time.zone.now,
    # enddate after Time.zone.now).
    # If these are less than the limit, slots coming up next will be added
    # slots starting at the same moment are ordered by enddate
    # slots with the same start and enddate are ordered by ID
    def slots_now
      @slots = policy_scope(:slot)

      render "v1/slots/index"
    end

    # GET /v1/users/1/slots/around
    # Supports pagination.
    # Returns all currently active slots (startdate before Time.zone.now,
    # enddate after Time.zone.now).
    # If these are less than the limit, the remaining amount is equally divided
    # between slots coming up next and past slots (start & enddate have just
    # been due)
    # slots starting at the same moment are ordered by enddate
    # slots with the same start and enddate are ordered by ID
    def slots_around
      fail 'TODO'

      render "v1/slots/index"
    end

    # GET /v1/users/1/slots/next
    # Supports pagination.
    # Returns the next set of slots based on the submitted parameter(s).
    # startdatetime is necessary, enddatetime, slot_id & limit are optional
    def slots_next
      fail 'TODO'

      render "v1/slots/index"
    end

    # GET /v1/users/1/slots/previous
    # Supports pagination.
    # Returns the previous set of slots based on the submitted parameter(s)
    # startdatetime is necessary, enddatetime, slot_id & limit are optional
    def slots_previous
      fail 'TODO'

      render "v1/slots/index"
    end

    # GET /v1/users/friendslots
    # This is weird and not nice, pundit scopes seem way to inflexible...
    # the 'resolve' method for SlotPolicy is already used by 'slots' method
    # using another name doesn't trigger 'performed' for the scoped policy
    # while the business logic is now in the policy instead of the model,
    # the instantiation of the policy is ugly as shit
    def slots_from_friends
      authorize :user

      ctx = UserContext.new(current_user, nil)
      @slots = SlotPolicy::Scope.new(ctx, BaseSlot).friend_slots

      render "v1/slots/index"
    end

    # GET /v1/users/1/media
    # get all media items of the given user
    def media_items
      authorize :user
      target_user = User.find_by(id: params.require(:user_id))
      @media_items = target_user.media_for(current_user)
      render "v1/media/index"
    end

    # POST /v1/users/add_friends
    # creates friend request or accepts friend request if one exists
    def add_friends
      authorize :user
      current_user.add_friends friends_ids

      head :ok
    end

    # POST /v1/users/remove_friends
    # deny friend request and unfriending
    def remove_friends
      authorize :user
      current_user.remove_friends friends_ids

      head :ok
    end

    private def user_create_params
      params.require(:email) unless params[:phone].present?
      params.require(:phone) unless params[:email].present?
      params.require(:password)
      params.require(:username)
      params.permit(:username, :email, :phone, :password)
    end

    private def user_params
      p = params.permit(:username,
                        :email,
                        :phone,
                        :password,
                        :image,
                        { location:
                            [:name, :thoroughfare, :sub_thoroughfare, :locality,
                             :sub_locality, :ocean, :administrative_area,
                             :sub_administrative_area, :postal_code, :country,
                             :iso_country_code, :in_land_water, :latitude,
                             :longitude, :private_location, :areas_of_interest]
                        },
                        :name,
                        :publicUrl,
                        :deviceToken,
                        :push,
                        :slotDefaultDuration,
                        :slotDefaultLocationId,
                        :slotDefaultTypeId,
                        :defaultPrivateAlerts,
                        :defaultOwnFriendslotAlerts,
                        :defaultOwnPublicAlerts,
                        :defaultFriendsFriendslotAlerts,
                        :defaultFriendsPublicAlerts,
                        :defaultReslotAlerts,
                        :defaultGroupAlerts)

      if params[:location].present?
        p[:location_attributes] = p.delete 'location'
        p[:location_attributes][:creator] = current_user
      end
      p.transform_keys(&:underscore) if p
    end

    private def user_image
      return nil unless params[:image].present?
      p = params.require(:image).permit(:publicId, :localId)
      p.transform_keys(&:underscore)
      p.transform_keys { |key| key.underscore.to_sym }
    end

    private def friends_ids
      params.require(:ids)
    end

    private def credentials
      params.require(:password)
      params.require(:email) unless params[:phone].present?
      params.require(:phone) unless params[:email].present?
      params.permit(:email, :phone, :password).symbolize_keys
    end
  end
end
