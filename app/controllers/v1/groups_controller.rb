module V1
  class GroupsController < ApplicationController
    # GET /v1/groups/:group_uuid
    def show
      @group = Group.find_by!(uuid: params[:group_uuid])
      authorize @group

      render :show
    end

    # POST /v1/groups
    def create
      authorize :group

      @group = Group.create_with_invitees(
        group_params: group_params.merge(owner: current_user),
        invitees: params[:invitees],
        initiator: current_user)

      if @group.errors.empty?
        render :show, status: :created
      else
        render json: { error: @group.errors },
               status: :unprocessable_entity
      end
    end

    # PATCH /v1/groups/:group_uuid
    # change name, image, subs_can - states
    def update
      @group = Group.find_by!(uuid: params[:group_uuid])
      authorize @group

      if @group.update(group_params)
        render :show
      else
        render json: { error: @group.errors },
               status: :unprocessable_entity
      end
    end

    # DELETE /v1/groups/:group_uuid
    # remove group slots from schedule unless otherwise stated
    def destroy
      @group = Group.find_by!(uuid: params[:group_uuid])
      authorize @group

      # Params comes as URL Parameter and is not snake_cased automatically,
      # maybe with Rails 5
      unless params[:keepSlotsInSchedule] == '1'
        CalendarInScheduleManager.new(current_user).hide(@group)
      end

      if @group.delete
        render :show
      else
        render json: { error: @group.errors },
               status: :unprocessable_entity
      end
    end

    # GET /v1/groups/:group_uuid/slots
    def slots
      @group = Group.find_by!(uuid: params[:group_uuid])
      authorize @group

      render :slots
    end

    # GET /v1/groups/:group_uuid/members
    def members
      @group = Group.find_by!(uuid: params[:group_uuid])
      authorize @group

      render :members
    end

    # GET /v1/groups/:group_uuid/related
    def related
      group = Group.find_by!(uuid: params[:group_uuid])
      authorize group

      render :related, locals: { memberships: group.related_memberships }
    end

    # GET /v1/groups/:group_id/members/:user_id
    # return if the specified user is an activated member of the specified group
    # or return the state of the specified user regarding the specified group
    # def membership_state
    # end

    # POST /v1/groups/:group_uuid/accept
    def accept_invite
      group = Group.find_by!(uuid: params[:group_uuid])
      authorize group

      if current_user.accept_invite group.id
        head :ok
      else
        render json: { error: "accepting group invitation failed" },
               status: :unprocessable_entity
      end
    end

    # POST /v1/groups/:group_uuid/refuse
    def refuse_invite
      group = Group.find_by!(uuid: params[:group_uuid])
      authorize group

      if current_user.refuse_invite group.id
        head :ok
      else
        render json: { error: "refusing group invitation failed" },
               status: :unprocessable_entity
      end
    end

    # POST /v1/calendars/:slotgroup_uuid/subscribe
    # current user subscribes to public calendar
    # create membership with state active
    def subscribe
      group = Group.find_by!(uuid: params[:slotgroup_uuid])
      authorize group
      group.invite_users([current_user.id])

      render :related, status: :created,
             locals: { memberships: group.related_memberships }
    end

    # POST /v1/groups/:group_uuid/members
    # current user adds other users to own group or to group
    # where he is member and members can invite
    # create membership with state active, (was: invited/pending before)
    # notify new members
    def invite
      group = Group.find_by!(uuid: params[:group_uuid])
      authorize group
      group.invite_users(params.require(:invitees), current_user)

      render :related, status: :created,
             locals: { memberships: group.related_memberships }
    end

    # DELETE /v1/groups/:group_uuid/members
    # current user leaves group
    # update membership with state left
    # remove current user from group members
    # remove group slots from schedule unless otherwise stated
    def leave
      group = Group.find_by!(uuid: params[:group_uuid])
      authorize group

      # Params comes as URL Parameter and is not snake_cased automatically,
      # maybe with Rails 5
      unless params[:keepSlotsInSchedule] == '1'
        CalendarInScheduleManager.new(current_user).hide(group)
      end

      if current_user.leave_group group.id
        head :ok
      else
        render json: { error: "leaving group #{group.id} failed" },
               status: :unprocessable_entity
      end
    end

    # DELETE /v1/groups/:group_uuid/members/:user_id
    def kick
      group = Group.find_by!(uuid: params[:group_uuid])
      authorize group

      if group.kick_member user_id
        head :ok
      else
        render json: { error: "kicking member with id #{user_id}" \
                              " from group #{group.id} failed" },
               status: :unprocessable_entity
      end
    end

    # PATCH /v1/groups/:group_uuid/members
    # change membership settings if current user is group member
    # notifications, default_alerts
    def member_settings
      group = Group.find_by!(uuid: params[:group_uuid])
      authorize group
      @membership = current_user.update_member_settings(setting_params,
                                                        group.id)
      if @membership.errors.empty?
        head :ok
      else
        render json: { error: @membership.errors },
               status: :unprocessable_entity
      end
    end

    # POST /v1/groups/global_group
    # TODO: move logic somewhere else
    def global_group
      authorize current_user

      owner = GlobalSlot.category_as_user(params.require(:category_uuid))
      group = Group.find_or_create_by!(uuid: globalgroup[:muid],
                                       name: globalgroup[:name]) do |new_group|
        new_group.update(globalgroup.except(:muid, :slots))
        new_group.owner = owner
        new_group.public = true
      end

      authorize group
      group.add_slots globalgroup[:slots]

      head :ok
    end

    private def group_params
      params.permit(:name, :image, :description, :public,
                    :members_can_post, :members_can_invite)
    end

    private def globalgroup
      p = params.require(:group).permit(:name, :image, :description,
                                        :muid, :string_id, slots: [])
      p.transform_keys(&:underscore) if p
    end

    private def user_id
      params.require(:user_id)
    end

    private def setting_params
      params.require(:settings).permit(:notifications, :default_alerts)
    end
  end
end
