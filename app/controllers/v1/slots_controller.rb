module V1
  class SlotsController < ApplicationController
    # before_filter :signed_in?
    before_filter :sign_in, except: [:show, :show_many]

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
    # TODO: improve handling of notes
    def create_stdslot
      return head :unprocessable_entity if std_params[:visibility].blank?

      meta_slot = MetaSlot.create(meta_params.merge(creator: current_user))
      return render json: meta_slot.errors,
                    status: :unprocessable_entity unless meta_slot.save

      if alert_param.present?
        setting = SlotSetting.create(user: current_user, meta_slot: meta_slot,
                                     alerts: alert_param[:alerts])
        return render json: setting.errors,
                      status: :unprocessable_entity unless setting.save
      end

      @slot = StdSlot.new(std_params.merge(meta_slot: meta_slot,
                                           owner: current_user))

      if @slot.save
        if params[:notes].present?
          params[:notes].each do |note|
            @slot.notes.create(note_params(note))
          end
        end
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
                                     alerts: alert_param[:alerts])
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
      predecessor = BaseSlot.find(re_params)

      @slot = ReSlot.from_slot(predecessor: predecessor, slotter: current_user)

      if @slot.save
        render :show, status: :created
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
    # TODO: handle alerts
    def update_stdslot
      @slot = current_user.std_slots.find(params[:id])

      @slot.update(std_params) if std_params["visibility"].present?
      update_baseslot(@slot)
    end

    # PATCH /v1/groupslot/1
    def update_groupslot
      @slot = current_user.group_slots.find(params[:id])
      update_baseslot(@slot)
    end

    # PATCH /v1/reslot/1
    def update_reslot
      @slot = current_user.re_slots.find(params[:id])
      update_baseslot(@slot)
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

    # TODO: decide with pascal and peter how to handle reordering
    private def update_media_order
      if MediaItem.reorder? params[:orderingMedia]
        head :ok
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    end

    private def add_media(slot)
      slot.add_photos(params[:photos]) if params[:photos].present?
      slot.add_voices(params[:voices]) if params[:voices].present?
      slot.add_videos(params[:videos]) if params[:videos].present?
    end

    # TODO: refactor and improve media ordering
    private def update_baseslot(base_slot)
      # order is important so that added errors are not overwritten
      base_slot.update(meta_params) if meta_params
      add_media(base_slot)
      base_slot.update_notes(params[:notes]) if params[:notes].present?

      return update_media_order if params[:orderingMedia].present?

      if base_slot.errors.empty?
        # TODO: remove view template dependency on @slot class variable
        render :show, status: :ok
      else
        render json: base_slot.errors.messages,
               status: :unprocessable_entity
      end
    end
  end
end
