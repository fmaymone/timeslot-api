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
      @group = Group.find(params[:group_id])

      render :show
    end

    # POST /v1/groups
    def create
      @group = Group.new(group_create_params.merge(owner: current_user))

      if @group.save
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

      if image_param.present? && AddImage.call(@group, group_image_param).equal?(true)
        render "v1/media/create",
               status: :created,
               locals: { media_item_id: @group.image.id }
      elsif @group.update(group_create_params)
        head :no_content
      else
        render json: @group.errors, status: :unprocessable_entity
      end
    end

    # DELETE /v1/groups/:group_id
    def destroy
      @group = Group.find(params[:group_id])

      render :show if SoftDeleteService.call(@group)
    end

    # GET /v1/groups/:group_id/members
    def members
      @group = Group.find(membership_params[:group_id])
      @members = @group.members

      render :members
    end

    # GET /v1/groups/:group_id/members/:user_id
    # return if the specified user is an activated member of the specified group
    # or return the state of the specified user regarding the specified group
    # def membership_state
    # end

    # POST /v1/groups/:group_id/accept
    def accept_invite
      group = membership_params[:group_id]
      return head :forbidden unless current_user.is_invited? group

      @membership = current_user.get_membership group

      if @membership.activate
        head :ok
      else
        render json: @membership.errors, status: :unprocessable_entity
      end
    end

    # POST /v1/groups/:group_id/refuse
    def refuse_invite
      group = membership_params[:group_id]
      return head :forbidden unless current_user.is_invited? group

      @membership = current_user.get_membership group

      if @membership.refuse
        head :ok
      else
        render json: @membership.errors, status: :unprocessable_entity
      end
    end

    # POST /v1/groups/:group_id/members/:user_id
    # current user invites other user to own group
    # create membership with state invited/pending
    # notify invited user
    # TODO: put logic into service
    def invite
      group = membership_params[:group_id]
      return head :forbidden unless current_user.can_invite? group

      invitee = User.find(membership_params[:user_id])
      return head :ok if invitee.is_invited?(group) || invitee.is_member?(group)

      @membership = invitee.get_membership group
      @membership ||= Membership.new(membership_params)

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
      group = membership_params[:group_id]
      return head :forbidden if current_user.get_membership(group).nil?
      return head :ok unless current_user.is_member? group

      @membership = current_user.get_membership group

      if @membership.inactivate
        head :ok
      else
        render json: @membership.errors, status: :unprocessable_entity
      end
    end

    # DELETE /v1/groups/:group_id/members/:user_id
    def kick
      group = membership_params[:group_id]
      return head :forbidden unless current_user.is_owner? group

      kickee = User.find(membership_params[:user_id])
      return head :forbidden if kickee.get_membership(group).nil?
      return head :ok unless (kickee.is_member?(group) || kickee.is_invited?(group))

      @membership = kickee.get_membership group

      if @membership.kick
        head :ok
      else
        render json: @membership.errors, status: :unprocessable_entity
      end
    end

    # PATCH /v1/groups/:group_id/members
    # change membership settings if current user is group member
    # notifications
    def settings
      group = membership_params[:group_id]
      return head :not_found unless Group.exists?(group)
      return head :forbidden unless current_user.is_member? group

      @membership = current_user.get_membership group

      if @membership.update(membership_update_params)
        head :ok
      else
        render json: @membership.errors, status: :unprocessable_entity
      end
    end

    private def group_create_params
      params.require(:group).permit(:name, :subs_can_post, :subs_can_invite)
    end

    private def membership_params
      params.permit(:group_id, :user_id)
    end

    private def membership_update_params
      params.require(:group).permit(:notifications)
    end

    private def image_param
      params.require(:group)[:new_media]
    end

    private def group_image_param
      params.require(:group).require(:new_media).require(:public_id)
    end
  end
end
