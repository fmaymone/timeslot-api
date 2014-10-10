module V1
  class SlotsController < ApplicationController
    # GET /v1/slots/1
    # GET /v1/slots/1.json
    def show
      @slot = Slot.find(params.require(:id))

      render :show
    end

    # POST /v1/slots
    # POST /v1/slots.json
    def create
      @slot = Slot.new(slot_create_params)

      if @slot.save
        render :show, status: :created
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /v1/slots/1
    # PATCH/PUT /v1/slots/1.json
    def update
      @slot = Slot.find(params.require(:id))

      if @slot.update(slot_update_params)
        head :no_content
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    end

    # DELETE /v1/slots/1
    # DELETE /v1/slots/1.json
    def destroy
      @slot = Slot.find(params.require(:id))
      @slot.destroy

      head :no_content
    end

    private def slot_create_params
      params.permit(:title, :startdate, :enddate, :note, :visibility, :alerts)
    end

    private def slot_update_params
      params.require(:slot)
        .permit(:title, :startdate, :enddate, :note, :visibility, :alerts)
    end
  end
end
