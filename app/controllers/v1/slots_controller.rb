module V1
  class SlotsController < ApplicationController
    # before_filter :signed_in?
    before_filter :sign_in, except: [:show, :show_many]

    # GET /v1/slots
    # return all slots (std, group, re) of the current user
    def index
      @slots = current_user.slot_representations

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
      return head :unprocessable_entity if std_params[:visibility].blank?

      meta_slot = MetaSlot.create(meta_params.merge(creator: current_user))
      return render json: meta_slot.errors,
                    status: :unprocessable_entity unless meta_slot.save

      @slot = StdSlot.new(std_params.merge(meta_slot: meta_slot,
                                           owner: current_user))
      return render json: @slot.errors,
                    status: :unprocessable_entity unless @slot.save

      if alert_param.present?
        SetAlerts.call(@slot, current_user, alert_param[:alerts])
      end

      @slot.update_notes(params[:notes]) if params[:notes].present?

      if @slot.errors.empty?
        render :show, status: :created, locals: { slot: @slot }
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    end

    # POST /v1/groupslot
    def create_groupslot
      group = Group.find(group_param)

      if params[:metaSlotId].present?
        meta_slot = MetaSlot.find(params[:metaSlotId])
      else
        meta_slot = MetaSlot.create(meta_params.merge(creator: current_user))
        return render json: meta_slot.errors,
                      status: :unprocessable_entity unless meta_slot.save
      end

      @slot = GroupSlot.new(group: group, meta_slot: meta_slot)
      return render json: @slot.errors,
                    status: :unprocessable_entity unless @slot.save

      if alert_param.present?
        SetAlerts.call(@slot, current_user, alert_param[:alerts])
      end

      @slot.update_notes(params[:notes]) if params[:notes].present?

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

      slot.update(std_params) if std_params["visibility"].present?
      update_baseslot(slot)
    end

    # PATCH /v1/groupslot/1
    def update_groupslot
      slot = current_user.group_slots.find(params[:id])
      update_baseslot(slot)
    end

    # PATCH /v1/reslot/1
    def update_reslot
      slot = current_user.re_slots.find(params[:id])
      update_baseslot(slot)
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
      params.require(:groupId)
    end

    private def std_params
      params.permit(:visibility)
    end

    private def re_params
      params.require(:predecessorId)
    end

    private def meta_params
      parameter = params.permit(:title, :startDate, :endDate, :locationId)
      parameter.transform_keys(&:underscore)
    end

    private def alert_param
      params[:settings]
    end

    private def note_params(note)
      note.permit(:title, :content)
    end

    private def update_media(slot)
      media_map = [:photos, :voices, :videos]

      media_map.each do |media_type|
        next unless params[media_type].present?

        items = params[media_type].each do |item|
          item.transform_keys!(&:underscore)
        end

        if items.first.key? "media_id"
          unless ReorderMedia.call items
            slot.errors.add(:media_items, 'invalid ordering')
          end
        else
          slot.add_media_items(items, media_type)
        end
      end
    end

    private def update_baseslot(slot)
      # statement order is important, otherwise added errors may be overwritten
      slot.update(meta_params) if meta_params
      update_media(slot)
      slot.update_notes(params[:notes]) if params[:notes].present?
      SetAlerts.call(
        slot, current_user, alert_param[:alerts]) if alert_param.present?

      if slot.errors.empty?
        render :show, locals: { slot: slot }
      else
        render json: slot.errors.messages, status: :unprocessable_entity
      end
    end
  end
end
