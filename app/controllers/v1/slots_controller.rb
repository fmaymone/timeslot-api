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
            @slot.notes.create(note_create_params(note))
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
    def update_metaslot
      @meta_slot = current_user.created_slots.find(params[:id])

      if @meta_slot.update(meta_params)
        head :no_content
      else
        render json: @meta_slot.errors, status: :unprocessable_entity
      end
    end

    # PATCH /v1/stdslot/1
    # TODO: needs HEAVY refactoring, why can't I write attributes via delegates?
    def update_stdslot
      @slot = current_user.std_slots.find(params[:id])

      if params[:photos].present? ||
         params[:videos].present? ||
         params[:voices].present?
        params[:photos].present? && params[:photos].each do |photo|
          add_media(photo_create_params(photo))
        end
        params[:voices].present? && params[:voices].each do |voice|
          add_media(voice_create_params(voice))
        end
        params[:videos].present? && params[:videos].each do |video|
          add_media(video_create_params(video))
        end
      elsif params[:orderingMedia].present?
        update_media_order
      elsif params[:notes].present?
        # TODO: extend to allow updating of existing notes
        params[:notes].each do |note|
          @slot.notes.create(note_create_params(note))
        end
      elsif std_params["visibility"].present? && @slot.update(std_params)
        head :no_content
      elsif @slot.meta_slot.update(meta_params)
        head :no_content
      else
        render json: @slot.errors.add(:meta_slot, @slot.meta_slot.errors),
               status: :unprocessable_entity
      end
    end

    # PATCH /v1/groupslot/1
    # TODO: needs refactoring, why can't I write attributes via delegates?
    # TODO: add specs
    def update_groupslot
      @slot = current_user.group_slots.find(params[:id])

      if params[:photos].present?
        add_media
      elsif params[:orderingMedia].present?
        update_media_order
      elsif params[:notes].present?
        @slot.notes.create(note_create_params)
      elsif @slot.meta_slot.update(meta_params)
        head :no_content
      else
        render json: @slot.errors.add(:meta_slot, @slot.meta_slot.errors),
               status: :unprocessable_entity
      end
    end

    # PATCH /v1/reslot/1
    # TODO: needs refactoring
    # TODO: add specs
    def update_reslot
      @slot = current_user.re_slots.find(params[:id])

      if params[:photos].present?
        add_media
      elsif params[:orderingMedia].present?
        update_media_order
      elsif params[:notes].present?
        @slot.notes.create(note_create_params)
      elsif @slot.meta_slot.update(meta_params)
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

    private def video_create_params(video)
      # TODO: better handling and specing of duration and thumbnail
      parameter = video.permit(:publicId, :ordering, :mediaType, :duration,
                               :thumbnail).merge(mediaType: 'video')
      parameter.transform_keys(&:underscore)
    end

    private def voice_create_params(voice)
      # TODO: better handling and specing of duration
      parameter = voice.permit(:publicId, :ordering, :mediaType, :duration)
                  .merge(mediaType: 'voice')
      parameter.transform_keys(&:underscore)
    end

    private def photo_create_params(photo)
      parameter = photo.permit(:publicId, :ordering).merge(mediaType: 'image')
      parameter.transform_keys(&:underscore)
    end

    private def note_create_params(note)
      note.permit(:title, :content)
    end

    private def update_media_order
      if MediaItem.reorder? params[:orderingMedia]
        head :ok
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    end

    private def add_media(item)
      media_item = MediaItem.insert(@slot.media_items, item)
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
