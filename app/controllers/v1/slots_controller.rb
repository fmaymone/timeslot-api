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

      if params[:new_media].present?
        add_media_item
      elsif params[:ordering_media].present?
        update_media_order
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
      params.require(:new_slot)
        .permit(:title, :startdate, :enddate, :note, :visibility, :alerts)
    end

    private def slot_update_params
      params.permit(:title, :startdate, :enddate, :note, :visibility, :alerts)
    end

    private def media_item_create_params
      params.require(:new_media).permit(:public_id, :ordering, :media_type)
    end

    private def update_media_order
      if MediaItem.reorder? params[:ordering_media]
        head :ok
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    end

    private def add_media_item
      @media_item = MediaItem.insert(@slot.media_items,
                                     media_item_create_params)
      @slot.media_items << @media_item

      if @slot.save
        render "v1/media/create", status: :created
      else
        render json: @slot.errors.add(:media_item, @media_item.errors),
               status: :unprocessable_entity
      end
    end
  end
end
