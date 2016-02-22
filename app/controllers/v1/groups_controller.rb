module V1
  class GroupsController < ApplicationController
    # GET /v1/groups
    # return all groups where the current user is member
    def index
      authorize :group
      # @groups = current_user.groups_ordered
      @groups = current_user.groups

      render :index
    end

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
        invitees: params[:invitees])

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
    def destroy
      @group = Group.find_by!(uuid: params[:group_uuid])
      authorize @group

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

    # POST /v1/groups/:group_uuid/members
    # current user invites other users to own group or to group
    # where he is member and members can invite
    # create membership with state invited/pending
    # notify invited users
    def invite
      group = Group.find_by!(uuid: params[:group_uuid])
      authorize group
      group.invite_users(params.require(:invitees))

      render :related, status: :created,
             locals: { memberships: group.related_memberships }
    end

    # DELETE /v1/groups/:group_uuid/members
    # current user leaves group
    # update membership with state left
    # remove current user from group members
    def leave
      group = Group.find_by!(uuid: params[:group_uuid])
      authorize group

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

    private def group_params
      params.permit(:name, :image, :members_can_post, :members_can_invite)
    end

    private def user_id
      params.require(:user_id)
    end

    private def setting_params
      params.require(:settings).permit(:notifications, :default_alerts)
    end
  end
end
