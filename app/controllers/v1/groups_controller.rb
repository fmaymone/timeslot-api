module V1
  class GroupsController < ApplicationController
    # GET /v1/groups
    def index
      @groups = Group.all

      render :index
    end

    # GET /v1/groups/1
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

    # PATCH /v1/groups/1
    def update
      @group = Group.find(params[:id])

      if @group.update(group_create_params)
        head :no_content
      else
        render json: @group.errors, status: :unprocessable_entity
      end
    end

    # DELETE /v1/groups/1
    def destroy
      @group = Group.find(params[:id])
      @group.destroy

      head :no_content
    end

    private def group_create_params
      params.require(:group).permit(:name, :owner_id)
    end
  end
end
