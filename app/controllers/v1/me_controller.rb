module V1
  class MeController < ApplicationController
    before_action :authenticate_me_from_token!,
                  only: [:show, :update, :inactivate]

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
    # returns all std_slots of the current user
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

    # GET /v1/me/calendar
    # returns all slots current user has in her calendar
    def calendar
      authorize :me

      @slots = current_user.my_calendar_slots

      render "v1/slots/index"
    end

    # POST /v1/me/schedule/slotgroup/:uuid
    def add_slotgroup_to_schedule
      slotgroup = Group.find_by(uuid: params[:uuid])
      authorize slotgroup

      CalendarInScheduleManager.new(current_user).show(slotgroup)

      head :ok
    end

    # DELETE /v1/me/schedule/slotgroup/:uuid
    def remove_slotgroup_from_schedule
      slotgroup = Group.find_by(uuid: params[:uuid])
      authorize slotgroup

      CalendarInScheduleManager.new(current_user).hide(slotgroup)

      head :ok
    end

    # GET /v1/me/friendslots
    # returns all non-private slots of all friends from current user
    def slots_of_my_friends
      authorize :me

      collector = SlotsCollector.new(**slot_paging_params)
      @slots = collector.slots_from_friends(user: current_user)

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

    # GET /v1/me/suggested_users
    def suggested_users
      authorize :me

      @users = User.find some_foafs
      @users = [User.find_by(email: SUGGESTED_USER_EMAIL)] if @users.empty?

      render "v1/users/suggesties"
    end

    # GET /v1/me/friends
    def my_friends
      authorize :me
      @users = current_user.friends
      render "v1/users/list"
    end

    # GET /v1/me/slotgroups
    # return all groups where the current user is member
    def my_groups
      authorize :me
      @groups = current_user.active_groups
      render "v1/groups/index"
    end

    # PATCH /v1/me/device
    # updates an existing device or creates a new one with the given attributes
    def update_device
      authorize :me
      Device.update_or_create(current_user, device_params)
      head :ok
    end

    # POST /v1/me/friendship/1
    # creates a friend request to given user or accepts existing friend request
    def befriend
      authorize :me
      new_friend = User.find params[:user_id]

      friendship = current_user.initiate_friendship new_friend.id

      render "v1/users/show", locals: { user: new_friend,
                                        friendship: friendship }
    end

    # DELETE /v1/me/friendship/1
    # cancels existing friendship, rejects offered friendship,
    # deletes open friend request
    def unfriend
      authorize :me
      no_friend = User.find params[:user_id]

      friendship = current_user.invalidate_friendship no_friend.id

      render "v1/users/show", locals: { user: no_friend,
                                        friendship: friendship }
    end

    # POST /v1/me/add_friends
    # creates friend requests or accepts friend requests if they exist
    def add_friends
      authorize :me
      current_user.add_friends friends_ids

      head :ok
    end

    # POST /v1/me/remove_friends
    # deny friend request and unfriending
    def remove_friends
      authorize :me
      current_user.remove_friends friends_ids

      head :ok
    end

    private def some_foafs
      foaf_ids = []
      current_user.friends.each do |friend|
        foaf_ids += friend.friends_ids
      end
      # current_user.friends_ids.each do |friend|
      #   foaf_ids += UserQuery::Relationship.new(friend).my_friends.pluck(:id)
      # end
      foaf_ids.delete(current_user.id) # remove me
      foaf_ids -= current_user.contacts_ids # remove my friends & requested friends
      foaf_ids.uniq.sample(10) # take 10 random users
    end

    private def user_params
      p = params.permit(:username,
                        :lang,
                        :email,
                        :phone,
                        :password,
                        :picture,
                        { location:
                            [:name, :thoroughfare, :sub_thoroughfare, :locality,
                             :sub_locality, :ocean, :administrative_area,
                             :sub_administrative_area, :postal_code, :country,
                             :iso_country_code, :in_land_water, :latitude,
                             :longitude, :private_location, :areas_of_interest]
                        },
                        :name,
                        :public_url,
                        :push,
                        :slot_default_duration,
                        :slot_default_location_id,
                        :slot_default_type_id,
                        :default_private_alerts,
                        :default_own_friendslot_alerts,
                        :default_own_public_alerts,
                        :default_friends_friendslot_alerts,
                        :default_friends_public_alerts,
                        :default_reslot_alerts,
                        :default_group_alerts)

      # ios prefers to use 'image' instead of 'picture'
      p[:picture] = params[:image] if params[:image].present?

      if params[:location].present?
        p[:location_attributes] = p.delete 'location'
        p[:location_attributes][:creator] = current_user
      end
      p
    end

    private def device_params
      params.require(:device_id)
      params.permit(:device_id, :system, :version, :token, :endpoint)
    end

    private def friends_ids
      params.require(:ids)
    end
  end
end
