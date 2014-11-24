module V1
  class BaseSlotsController < ApplicationController
    # GET /v1/base_slots/1
    def show
      @base_slot = BaseSlot.find(params[:id])

      render json: @base_slot
    end

    # POST /v1/base_slots
    # create MetaSlot
    # create SlotSetting
    # create StdSlot
    # TODO: improve error handling
    def create
      meta_slot = MetaSlot.create(meta_slot_params.merge(creator: current_user))
      SlotSetting.create(user: current_user,
                         meta_slot: meta_slot,
                         alerts: alert_params)

      @std_slot = StdSlot.new(base_slot_params.merge(meta_slot: meta_slot))

      if @std_slot.save
        render :show, status: :created
      else
        render json: @std_slot.errors, status: :unprocessable_entity
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

    private def base_slot_params
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
