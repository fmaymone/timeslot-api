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

      meta_slot = MetaSlot.create(meta_slot_params.merge(creator: current_user))
      return render json: meta_slot.errors,
                    status: :unprocessable_entity unless meta_slot.save

      if alert_param.present?
        setting = SlotSetting.create(user: current_user, meta_slot: meta_slot,
                                     alerts: alert_param)
        return render json: setting.errors,
                      status: :unprocessable_entity unless setting.save
      end

      @slot = StdSlot.new(std_params.merge(meta_slot: meta_slot))

      if @slot.save
        render :show, status: :created
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    end

    # POST /v1/groupslot
    def create_groupslot
      group = Group.find(group_param)

      meta_slot = MetaSlot.create(meta_slot_params.merge(creator: current_user))
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
        id: re_params.require(:predecessor_id),
        sub_type: re_params.require(:predecessor_type)
      ).first
      # TODO: use model initializer
      @slot = ReSlot.new(slotter: current_user,
                         predecessor: predecessor,
                         predecessor_type: predecessor.sub_type,
                         meta_slot: predecessor.meta_slot)

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

    private def group_param
      params.require(:new_slot).require(:group_id)
    end

    private def std_params
      params.require(:new_slot).permit(:visibility)
    end

    private def re_params
      params.require(:re_slot).permit(:predecessor_id, :predecessor_type)
    end

    private def meta_slot_params
      params.require(:new_slot).permit(:title, :startdate, :enddate)
    end

    private def alert_param
      params.require(:new_slot).permit(:alerts)[:alerts]
    end
  end
end
