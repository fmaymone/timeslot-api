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
      predecessor = BaseSlot.where(
        id: re_params.require(:predecessorId),
        sub_type: re_params.require(:predecessorType)
      ).first

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

    # DELETE /v1/std_slot/1
    def destroy_stdslot
      @slot = current_user.std_slots.find(params.require(:id))

      # TODO: handle alarm/slot_setting

      render :show if SoftDelete.call(@slot)
    end

    # DELETE /v1/group_slot/1
    def destroy_groupslot
      @slot = current_user.group_slots.find(params.require(:id))

      # TODO: handle alarm/slot_setting

      render :show if SoftDelete.call(@slot)
    end

    # DELETE /v1/re_slot/1
    def destroy_reslot
      @slot = current_user.re_slots.find(params.require(:id))

      # delete SlotSetting object if one exists and it is only referenced by
      # this reslot or softdeleted slots
      # TODO: add helper within user model to get slot_setting references
      condition = { meta_slot: @slot.meta_slot.id }

      if current_user.slot_settings.where(condition).exists?
        unless current_user.std_slots.active.where(condition).exists? ||
               current_user.group_slots.active.where(condition).exists?
          SoftDelete.call(current_user.slot_settings.where(condition).first)
        end
      end

      render :show if SoftDelete.call(@slot)
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

    private def alert_param
      params.require(:new_slot).permit(:alerts)[:alerts]
    end
  end
end
