module V1
  class SlotsController < ApplicationController
    # before_filter :signed_in?
    before_filter :sign_in, except: [:show, :show_many]

    # GET /v1/slots
    # return all slots (std, group, re) of the current user
    def index
      @slots = current_user.all_slots

      render :index
    end

    # GET /v1/slots/1
    def show
      render :show, locals: { slot: BaseSlot.get(params[:id]) }
    end

    # POST /v1/slots
    def show_many
      @slots = BaseSlot.get_many(params[:ids])

      render :index
    end

    # POST /v1/stdslot
    def create_stdslot
      slot = StdSlot.add(meta_params, std_params, note_param,
                         alerts_param, current_user)

      if slot.errors.empty?
        render :show, status: :created, locals: { slot: slot }
      else
        render json: slot.errors, status: :unprocessable_entity
      end
    end

    # POST /v1/groupslot
    def create_groupslot
      # TODO: can only be done if current_user is group owner or
      # member and members can post
      @slot = GroupSlot.add(meta_params, group_param, note_param,
                            alerts_param, current_user)

      if @slot.errors.empty?
        render :show, status: :created, locals: { slot: @slot }
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    end

    # POST /v1/reslot
    def create_reslot
      predecessor = BaseSlot.find(re_params)

      @slot = ReSlot.from_slot(predecessor: predecessor, slotter: current_user)

      if @slot.save
        render :show, status: :created, locals: { slot: @slot }
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    end

    # PATCH /v1/metaslot/1
    # TODO: Do we want to keep this?
    def update_metaslot
      @meta_slot = current_user.created_slots.find(params[:id])

      if @meta_slot.update(meta_params)
        head :no_content
      else
        render json: @meta_slot.errors, status: :unprocessable_entity
      end
    end

    # PATCH /v1/stdslot/1
    def update_stdslot
      slot = current_user.std_slots.find(params[:id])

      slot.update(std_params) if params["visibility"].present?
      slot.update_from_params(meta_params, media_params, note_param,
                              alerts_param, current_user)

      if slot.errors.empty?
        render :show, locals: { slot: slot }
      else
        render json: slot.errors.messages, status: :unprocessable_entity
      end
    end

    # PATCH /v1/groupslot/1
    def update_groupslot
      slot = current_user.group_slots.find(params[:id])
      slot.update_from_params(meta_params, media_params, note_param,
                              alerts_param, current_user)

      if slot.errors.empty?
        render :show, locals: { slot: slot }
      else
        render json: slot.errors.messages, status: :unprocessable_entity
      end
    end

    # PATCH /v1/reslot/1
    def update_reslot
      slot = current_user.re_slots.find(params[:id])
      slot.update_from_params(meta_params, media_params, note_param,
                              alerts_param, current_user)

      if slot.errors.empty?
        render :show, locals: { slot: slot }
      else
        render json: slot.errors.messages, status: :unprocessable_entity
      end
    end

    # DELETE /v1/std_slot/1
    def destroy_stdslot
      @slot = current_user.std_slots.find(params.require(:id))

      if @slot.delete
        render :show, locals: { slot: @slot }
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    end

    # DELETE /v1/group_slot/1
    def destroy_groupslot
      @slot = current_user.group_slots.find(params.require(:id))

      if @slot.delete
        render :show, locals: { slot: @slot }
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    end

    # DELETE /v1/re_slot/1
    def destroy_reslot
      @slot = current_user.re_slots.find(params.require(:id))

      if @slot.delete
        render :show, locals: { slot: @slot }
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    end

    private def group_param
      group = Group.find(params.require(:groupId))
      { group: group }
    end

    private def std_params
      params.require(:visibility)
      params.permit(:visibility)
    end

    private def re_params
      params.require(:predecessorId)
    end

    private def meta_params
      p = params.permit(:title, :startDate, :endDate, :locationId, :metaSlotId)
      p.transform_keys(&:underscore)
    end

    private def alerts_param
      params[:settings][:alerts] if params[:settings].present?
    end

    private def note_param
      params.require(:notes) if params[:notes].present?
    end

    private def media_params
      item_params = [:publicId, :position, :mediaId]
      params.permit(photos: item_params, voices: item_params, videos: item_params)
    end
  end
end
