module V1
  class MeController < ApplicationController
    # GET /v1/me
    def show
      authorize :me
      render :show, locals: { user: current_user }
    end

    # PATCH /v1/me
    def update
      authorize :me

      # move this into pundit
      if params[:password].present?
        password = params.require(:old_password)
        pw_correct = current_user == current_user.try(:authenticate, password)
        return head :unauthorized unless pw_correct
      end

      if current_user.update(user_params)
        render :show, locals: { user: current_user }
      else
        render json: { error: current_user.errors },
               status: :unprocessable_entity
      end
    end

    # DELETE /v1/me
    def inactivate
      authorize :me

      # user inactivate methode not yet fully implemented
      if current_user.inactivate
        render :show, locals: { user: current_user }
      else
        render json: { error: current_user.errors },
               status: :unprocessable_entity
      end
    end

    # TODO: we need an re-activate method also
    # def reactivate
    # end

    # GET /v1/me/signout
    # invalidates auth token
    def signout
      authorize :me
      current_user.sign_out
      head :ok
    end

    # GET /v1/me/slots
    # returns all std_slots and re_slots of the current user
    def my_slots
      authorize :me

      collector = SlotsCollector.new(**slot_paging_params)
      @slots = collector.my_slots(user: current_user)

      if slot_paging_params.blank?
        render "v1/slots/index"
      else
        @result = SlotPaginator.new(data: @slots, **slot_paging_params)
        render "v1/paginated/slots"
      end
    end

    # GET /v1/me/media
    def my_media_items
      authorize :me
      @media_items = current_user.media_items
      render "v1/media/index"
    end

    # PATCH /v1/me/device
    # updates an existing device or creates a new one with the given attributes
    def update_device
      authorize :me
      Device.update_or_create(current_user, device_params)
      head :ok
    end

    private def user_params
      p = params.permit(:username,
                        :lang,
                        :email,
                        :phone,
                        :password,
                        :picture,
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

    private def device_params
      params.require(:deviceId)
      params.permit(:deviceId, :system, :version, :token, :endpoint)
        .transform_keys(&:underscore)
        .symbolize_keys
    end
  end
end
