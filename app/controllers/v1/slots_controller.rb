module V1
  class SlotsController < ApplicationController
    # GET /v1/slots/1
    def show
      @slot = Slot.find(params.require(:id))

      render :show
    end

    # POST /v1/slots
    def create
      @slot = Slot.new(slot_create_params)

      if @slot.save
        render :create, status: :created
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    end

    # PATCH /v1/slots/1
    def update
      @slot = Slot.find(params.require(:id))

      if params[:signed_identifier].present? &&
         params[:media].present? &&
         add_new_media?
        render "v1/media/create", status: :created
      elsif @slot.update_attributes(slot_update_params)
        head :no_content
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    end

    # DELETE /v1/slots/1
    def destroy
      slot = Slot.find(params.require(:id))
      slot.destroy

      head :no_content
    end

    private def slot_create_params
      params.permit(:title, :startdate, :enddate, :note, :visibility, :alerts)
    end

    private def slot_update_params
      params.permit(:title, :startdate, :enddate, :note, :visibility, :alerts)
    end

    private def media_item_create_params
      params.require(:media).permit(:public_id, :ordering, :media_type)
    end

    private def add_new_media?
      @media_item = MediaItem.create(media_item_create_params)
      @slot.media_items << @media_item
      if @media_item.save
        return true
      else
        return false
      end
    end
  end
end
