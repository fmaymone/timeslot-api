module V1
  class GlobalSlotsController < ApplicationController
    # POST /v1/globalslots/reslot
    def create_reslot
      authorize GlobalSlot.new

      muid = params.require(:predecessor)
      global_slot = GlobalSlot.find_or_create(muid)
      add_to_slotsets(global_slot, params[:slot_groups] ||
                                   [current_user.my_cal_uuid])

      if global_slot.errors.empty?
        render "v1/slots/create", status: :created, locals: { slot: global_slot }
      else
        render json: { error: global_slot.errors }, status: :unprocessable_entity
      end
    end
  end
end
