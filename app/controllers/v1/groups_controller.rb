module V1
  class GroupsController < ApplicationController
    # GET /v1/groups
    def index
      # return all groups where the current user is member or owner
      @groups = Group.all

      render :index
    end

    # GET /v1/groups/:group_id
    def show
      @group = Group.find(params[:id])

      render :show
    end

    # POST /v1/groups
    def create
      @group = Group.new(group_create_params)

      if @group.save
        render :show, status: :created
      else
        render json: @group.errors, status: :unprocessable_entity
      end
    end

    # PATCH /v1/groups/:group_id
    # change name, image, subs_can - states
    def update
      @group = Group.find(params[:id])

      if @group.update(group_create_params)
        head :no_content
      else
        render json: @group.errors, status: :unprocessable_entity
      end
    end

    # DELETE /v1/groups/:group_id
    def destroy
      @group = Group.find(params[:id])

      render :show if SoftDeleteService.call(@group)
    end

    # GET /v1/groups/:group_id/members
    # returns a list of all members of the specified group
    def members
    end

    # GET /v1/groups/:group_id/members/:user_id
    # return if the specified user is an activated member of the specified group
    # or return the state of the specified user regarding the specified group
    # def membership_state
    # end

    # POST /v1/groups/:group_id/members
    # current user accepts invite and joins group
    # update membership with state joined/active
    # add current user as group member
    def accept_invite
    end

    # POST /v1/groups/:group_id/members/:user_id
    # current user invites other user to own group
    # create membership with state invited/pending
    # notify invited user
    def invite
      group = invite_params[:group_id]
      return head :forbidden unless current_user.can_invite? group

      invitee = User.find(invite_params[:user_id])
      return head :ok if invitee.has_invitation? group

      @membership = Membership.new(invite_params)

      if @membership.invite && @membership.save
        head :created
      else
        render json: @membership.errors, status: :unprocessable_entity
      end
    end

    # DELETE /v1/groups/:group_id/members
    # current user leaves group
    # update membership with state left
    # remove current user from group members
    def leave
    end

    # DELETE /v1/groups/:group_id/members/:user_id
    # current user removes other user from own group
    # update membership with state kicked
    # remove other user from group members
    def kick
    end

    # PATCH /v1/groups/:group_id/members
    # change membership settings if current user is group member
    # notifications
    def settings
    end

    private def group_create_params
      params.require(:group).permit(:name, :owner_id)
    end

    private def invite_params
      params.permit(:group_id, :user_id)
    end
  end
end
