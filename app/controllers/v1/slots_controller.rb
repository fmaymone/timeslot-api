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

      if media_data?
        update_media
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
      params.require(:new_media).permit(:public_id, :ordering, :media_type)
    end

    private def ordering_param
      media_item_create_params.require(:ordering)
    end

    private def media_data?
      params[:new_media].present? || params[:ordering_media].present?
    end

    private def update_media
      if params[:new_media].present?
        if add_media?
          render "v1/media/create", status: :created
        else
          render json: @slot.errors.add(:media_item, @media_item.errors),
                 status: :unprocessable_entity
        end
      else
        if reorder_media?
          head :ok
        else
          render json: @slot.errors, status: :unprocessable_entity
        end
      end
    end

    private def add_media?
      new_media = media_item_create_params

      if !new_media.key? :ordering
        new_media.merge!(ordering: @slot.media_items.size)
      elsif ordering_param.to_i < @slot.media_items.size
        needs_ordering_update
      end

      @media_item = MediaItem.create(new_media)
      @slot.media_items << @media_item
      @slot.save
    end

    private def needs_ordering_update
      media_items = @slot.media_items.where(
        "media_items.ordering >= ?", ordering_param).to_a

      media_items.each do |item|
        item.update(ordering: item.ordering += 1)
      end
    end

    private def reorder_media?
      return false unless valid_ordering? params[:ordering_media]

      media_items = @slot.media_items
      par = params[:ordering_media]
      # TODO: IMP remove n+1 query
      par.each do |item|
        item_id = item[:media_item_id]
        item_order = item[:ordering]
        media_items.find(item_id).update(ordering: item_order)
      end
      @slot.save
    end

    private def valid_ordering?(parameter)
      arr = parameter.map { |i| i[:ordering].to_i }
      no_gaps = arr.size > arr.max
      dups = arr.find { |e| arr.rindex(e) != arr.index(e) }
      @slot.errors.add(:duplicate_ordering, dups) if dups
      dups.nil? && no_gaps
    end
  end
end
