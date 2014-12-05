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
    # TODO: can probably be removed
    def show
      @slot = BaseSlot.get(params[:id])

      render :show
    end

    # POST /v1/slots
    # TODO: add request specs
    # TODO: add acceptance specs
    # TODO: add routing specs
    def show_many
      @slots = BaseSlot.get_many(params[:ids])

      render :index
    end

    # POST /v1/stdslot
    def create_stdslot
      return head :unprocessable_entity if std_params[:visibility].blank?

      meta_slot = MetaSlot.create(meta_params.merge(creator: current_user))
      return render json: meta_slot.errors,
                    status: :unprocessable_entity unless meta_slot.save

      if alert_param.present?
        setting = SlotSetting.create(user: current_user, meta_slot: meta_slot,
                                     alerts: alert_param)
        return render json: setting.errors,
                      status: :unprocessable_entity unless setting.save
      end

      @slot = StdSlot.new(std_params.merge(meta_slot: meta_slot, owner: current_user))

      if @slot.save
        render :show, status: :created
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    end

    # POST /v1/groupslot
    def create_groupslot
      group = Group.find(group_param)

      meta_slot = MetaSlot.create(meta_params.merge(creator: current_user))
      return render json: meta_slot.errors,
                    status: :unprocessable_entity unless meta_slot.save

      # TODO: make service for alarm
      if alert_param.present?
        setting = SlotSetting.create(user: current_user, meta_slot: meta_slot,
                                     alerts: alert_param)
        return render json: setting.errors,
                      status: :unprocessable_entity unless setting.save
      end

      @slot = GroupSlot.new(group: group, meta_slot: meta_slot)

      if @slot.save
        render :show, status: :created
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    end

    # POST /v1/reslot
    def create_reslot
      predecessor = BaseSlot.find(re_params.require(:predecessorId))

      @slot = ReSlot.from_slot(predecessor: predecessor, slotter: current_user)

      if @slot.save
        render :show, status: :created
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    end

    # PATCH /v1/metaslot/1
    def update_metaslot
      @meta_slot = current_user.created_slots.find(params[:id])

      if @meta_slot.update(update_meta_params)
        head :no_content
      else
        render json: @meta_slot.errors, status: :unprocessable_entity
      end
    end

    # PATCH /v1/stdslot/1
    # TODO: needs refactoring, why can't I write attributes via delegates?
    def update_stdslot
      @slot = current_user.std_slots.find(params[:id])

      if params[:newMedia].present?
        add_media_item
      elsif params[:orderingMedia].present?
        update_media_order
      elsif update_std_params[:visibility].present? &&
            @slot.update(update_std_params.permit(:visibility))
        head :no_content
      elsif @slot.meta_slot.update(update_std_params)
        head :no_content
      else
        render json: @slot.errors.add(:meta_slot, @slot.meta_slot.errors),
               status: :unprocessable_entity
      end
    end

    # DELETE /v1/std_slot/1
    def destroy_stdslot
      @slot = current_user.std_slots.find(params.require(:id))

      if @slot.delete
        render :show
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    end

    # DELETE /v1/group_slot/1
    def destroy_groupslot
      @slot = current_user.group_slots.find(params.require(:id))

      if @slot.delete
        render :show
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    end

    # DELETE /v1/re_slot/1
    def destroy_reslot
      @slot = current_user.re_slots.find(params.require(:id))

      if @slot.delete
        render :show
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    end

    private def group_param
      params.require(:new_slot).require(:groupId)
    end

    private def std_params
      params.require(:new_slot).permit(:visibility)
    end

    private def re_params
      params.require(:re_slot).permit(:predecessorId, :predecessorType)
    end

    private def meta_params
      params.require(:new_slot).permit(:title, :startdate, :enddate)
    end

    private def update_meta_params
      params.require(:metaSlot).permit(:title, :startdate, :enddate)
    end

    private def update_std_params
      params.require(:stdSlot).permit(:title, :startdate, :enddate, :visibility)
    end

    private def alert_param
      params.require(:new_slot).permit(:alerts)[:alerts]
    end

    private def media_item_create_params
      params.require(:newMedia).permit(:public_id, :ordering, :media_type)
      # params.require(:newMedia).permit(:publicId, :ordering, :mediaType)
    end

    private def update_media_order
      if MediaItem.reorder? params[:orderingMedia]
        head :ok
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    end

    private def add_media_item
      media_item = MediaItem.insert(@slot.media_items, media_item_create_params)
      @slot.media_items << media_item

      if @slot.save
        render "v1/media/create", status: :created,
               locals: { media_item_id: media_item.id }
      else
        render json: @slot.errors.add(:media_item, media_item.errors),
               status: :unprocessable_entity
      end
    end
  end
end
