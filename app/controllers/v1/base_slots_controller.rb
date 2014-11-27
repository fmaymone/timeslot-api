module V1
  class BaseSlotsController < ApplicationController
    # GET /v1/slots
    # return all slots (std, group, re) of the current user
    def index
      @slots = []
      @slots.push(*current_user.std_slots)
      @slots.push(*current_user.re_slots)
      @slots.push(*current_user.group_slots)

      render :index
    end

    # GET /v1/slots/1
    def show
      @base_slot = BaseSlot.find(params[:id])

      render json: @base_slot
    end

    # POST /v1/slots
    # TODO: needs refactoring
    def create
      if group_params[:group_id].present?
        return head :unprocessable_entity unless Group.exists?(group_params[:group_id])
      elsif std_params[:visibility].blank?
        return head :unprocessable_entity
      end

      meta_slot = MetaSlot.create(meta_slot_params.merge(creator: current_user))
      return render json: meta_slot.errors,
                    status: :unprocessable_entity unless meta_slot.save

      if group_params[:group_id].present?
        @slot = GroupSlot.new(group_params.merge(meta_slot: meta_slot))
      else
        slot_setting = SlotSetting.create(user: current_user,
                                          meta_slot: meta_slot,
                                          alerts: alert_params)
        return render json: slot_setting.errors,
                      status: :unprocessable_entity unless slot_setting.save
        @slot = StdSlot.new(std_params.merge(meta_slot: meta_slot))
      end

      if @slot.save
        render :show, status: :created
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    end

    # PATCH /v1/base_slots/1
    def update
      @base_slot = BaseSlot.find(params[:id])

      if @base_slot.update(base_slot_params)
        head :no_content
      else
        render json: @base_slot.errors, status: :unprocessable_entity
      end
    end

    # DELETE /v1/base_slots/1
    def destroy
      @base_slot = BaseSlot.find(params[:id])
      @base_slot.destroy

      head :no_content
    end

    private def group_params
      params.require(:new_slot).permit(:group_id)
    end

    private def std_params
      params.require(:new_slot).permit(:visibility)
    end

    private def meta_slot_params
      params.require(:new_slot).permit(:title, :startdate, :enddate)
    end

    private def alert_params
      params.require(:new_slot).permit(:alerts)[:alerts]
    end
  end
end
