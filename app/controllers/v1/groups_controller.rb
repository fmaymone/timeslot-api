module V1
  class GroupsController < ApplicationController
    # GET /v1/groups
    # return all groups where the current user is member
    def index
      @groups = current_user.groups

      render :index
    end

    # GET /v1/groups/:group_id
    def show
      @group = Group.find(params[:group_id])

      render :show
    end

    # POST /v1/groups
    def create
      @group = Group.create_with_image(group_params.merge(owner: current_user))

      if @group.errors.empty?
        render :show, status: :created
      else
        render json: @group.errors, status: :unprocessable_entity
      end
    end

    # PATCH /v1/groups/:group_id
    # change name, image, subs_can - states
    def update
      @group = Group.find(params[:group_id])
      return head :forbidden unless current_user.is_owner? @group.id

      @group.update_with_image(group_params) unless group_params.empty?

      if @group.errors.empty?
        render :show
      else
        render json: @group.errors, status: :unprocessable_entity
      end
    end

    # DELETE /v1/groups/:group_id
    def destroy
      @group = Group.find(params[:group_id])
      return head :forbidden unless current_user.is_owner? @group.id

      if @group.delete
        render :show
      else
        render json: @group.errors, status: :unprocessable_entity
      end
    end

    # GET /v1/groups/:group_id/members
    def members
      @group = Group.find(membership_params[:group_id])

      render :members
    end

    # GET /v1/groups/:group_id/related
    def related
      group = Group.find(params.require(:group_id))

      render :related, locals: { memberships: group.related_memberships }
    end

    # GET /v1/groups/:group_id/members/:user_id
    # return if the specified user is an activated member of the specified group
    # or return the state of the specified user regarding the specified group
    # def membership_state
    # end

    # POST /v1/groups/:group_id/accept
    def accept_invite
      return head :forbidden unless current_user.is_invited? group_id

      if current_user.accept_invite group_id
        head :ok
      else
        render json: { membership: "error accepting invite" },
               status: :unprocessable_entity
      end
    end

    # POST /v1/groups/:group_id/refuse
    def refuse_invite
      return head :forbidden unless current_user.is_invited? group_id

      if current_user.refuse_invite group_id
        head :ok
      else
        render json: { membership: "error refusing invite" },
               status: :unprocessable_entity
      end
    end

    # POST /v1/groups/:group_id/members
    # current user invites other users to own group or to group
    # where he is member and members can invite
    # create membership with state invited/pending
    # notify invited users
    def invite
      group = Group.find(params.require(:group_id))
      return head :forbidden unless current_user.can_invite? group.id

      group.invite_users(params.require(:ids))

      render :related, status: :created,
             locals: { memberships: group.related_memberships }
    end

    # DELETE /v1/groups/:group_id/members
    # current user leaves group
    # update membership with state left
    # remove current user from group members
    def leave
      return head :forbidden if current_user.get_membership(group_id).nil?
      return head :ok unless current_user.is_active_member? group_id

      if current_user.leave_group group_id
        head :ok
      else
        render json: { membership: "error leaving group #{group_id}" },
               status: :unprocessable_entity
      end
    end

    # DELETE /v1/groups/:group_id/members/:user_id
    def kick
      group = Group.find(params.require(:group_id))
      return head :forbidden unless current_user.is_owner? group.id

      kickee = User.find(membership_params[:user_id])
      return head :forbidden if kickee.get_membership(group.id).nil?
      return head :ok unless (kickee.is_active_member?(group.id) ||
                              kickee.is_invited?(group.id))

      if group.kick_member kickee
        head :ok
      else
        render json: { membership: "error kicking member with id #{user_id}" \
                                   " from group #{group_id}" },
               status: :unprocessable_entity
      end
    end

    # PATCH /v1/groups/:group_id/members
    # change membership settings if current user is group member
    # notifications, default_alerts
    def member_settings
      return head :forbidden unless current_user.is_active_member? group_id

      @membership = current_user.update_member_settings(setting_params, group_id)
      if @membership.errors.empty?
        head :ok
      else
        render json: @membership.errors, status: :unprocessable_entity
      end
    end

    private def group_params
      parameter = params.permit(:name, :membersCanPost, :membersCanInvite)
      parameter.merge!("public_id" => image_param) if params[:image].present?
      parameter.transform_keys(&:underscore)
    end

    private def membership_params
      params.permit(:group_id, :user_id)
    end

    private def group_id
      params.require(:group_id)
    end

    private def setting_params
      p = params.require(:settings).permit(:notifications, :defaultAlerts)
      p.transform_keys(&:underscore)
    end

    private def image_param
      params.require(:image).require(:publicId)
    end
  end
end
