module V1
  class GroupsController < ApplicationController
    # GET /v1/groups
    def index
      # what to do with this?
      # return all lists ???
      # return all groups where the current user is member or owner ???
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
    # change name, image, owner, subs_can - states
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
    # GET /v1/groups/members
    # returns a list of all members of the specified group ordered by state
    def members
    end

    # GET /v1/groups/:group_id/members/:user_id
    # GET /v1/groups/members/show
    # Check if the specified user is a member of the specified group
    def membership_state
    end

    # POST /v1/groups/:group_id/members
    # POST /v1/groups/members/create
    # current user joins group
    # update membership with state joined/active
    # add current user as group member
    def join
    end

    # POST /v1/groups/:group_id/members/:user_id
    # current user invites other user to own group
    # create membership with state invited/pending
    def invite
    end

    # DELETE /v1/groups/:group_id/members
    # POST /v1/groups/members/destroy
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

    # GET /v1/groups/ownerships/(:user_id)
    # returns all groups where user is owner
    # if no user ID is submitted the current user is assumed
    def ownerships
    end

    # GET /v1/groups/memberships/(:user_id)
    # returns all groups where user is member
    # if no user ID is submitted the current user is assumed
    def memberships
    end

    # POST /v1/groups/:group_id/notifications
    # enables group notifications if current user is group member
    def enable_notifications
    end

    # DELETE /v1/groups/:group_id/notifications
    # disables group notifications if current user is group member
    def disable_notifications
    end

    private def group_create_params
      params.require(:group).permit(:name, :owner_id)
    end
  end
end
