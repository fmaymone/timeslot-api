module V1
  class SlotsController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:show, :show_many]

    # GET /v1/slots/1
    def show
      @slot = BaseSlot.get(params[:id])
      authorize @slot

      render :show, locals: { slot: @slot }
    end

    # POST /v1/slots
    def show_many
      @slots = BaseSlot.get_many(params[:ids])
      @slots.each { |slot| authorize slot }

      render :index
    end

    # GET /v1/slots/demo
    def show_last
      authorize :stdSlot

      if slot_paging_params.blank?
        slot_count = ENV['DEMO_SLOTS_COUNT'].try(:to_i) || 100
        @slots = StdSlotPublic
                 .includes(:notes, :media_items,
                           meta_slot: [:ios_location, :creator])
                 .last(slot_count)
        render :index
      else
        collector = SlotsCollector.new(**slot_paging_params)
        @slots = collector.latest_public_slots
        @result = SlotPaginator.new(data: @slots, **slot_paging_params)
        render "v1/paginated/slots"
      end
    end

    # POST /v1/stdslot
    def create_stdslot
      authorize :stdSlot
      @slot = BaseSlot.create_slot(meta: meta_params,
                                   visibility: enforce_visibility,
                                   media: media_params, notes: note_param,
                                   alerts: alerts_param, user: current_user)

      if @slot.errors.empty?
        render :create, status: :created, locals: { slot: @slot }
      else
        render json: { error: @slot.errors },
               status: :unprocessable_entity
      end
    end

    # POST /v1/groupslot
    def create_groupslot
      authorize GroupSlot.new(group: group)

      @slot = BaseSlot.create_slot(meta: meta_params, group: group,
                                   media: media_params, notes: note_param,
                                   alerts: alerts_param, user: current_user)

      if @slot.errors.empty?
        render :show, status: :created, locals: { slot: @slot }
      else
        render json: { error: @slot.errors },
               status: :unprocessable_entity
      end
    end

    # POST /v1/reslot
    def create_reslot
      predecessor = BaseSlot.get(re_params)
      authorize predecessor

      @slot = ReSlot.create_from_slot(predecessor: predecessor,
                                      slotter: current_user)
      if @slot.save
        render :create, status: :created, locals: { slot: @slot }
      else
        render json: { error: @slot.errors },
               status: :unprocessable_entity
      end
    end

    # POST /v1/reslot
    def create_webslot
      authorize :stdSlot

      # TODO: we need an unique identifier from each crawler slot to re-identify
      # exist reslots
      # Check if Slot already exist
      user_reslots = current_user.re_slots.joins(:meta_slot)
      same_reslot = user_reslots.where(
        'meta_slots.start_date = ? AND meta_slots.title = ?',
        params.require(:startDate), params.require(:title)
      )
      return head 421 if same_reslot.any?

      # Set Slot Creator:
      slot_creator = User.find_by(email: 'info@timeslot.com')
      # Create MetaSlot:
      metaslot = MetaSlot.find_by(creator_id: slot_creator.id,
                                  start_date: params[:startDate],
                                  title: params[:title])
      # Create BaseSlot:
      if metaslot
        @slot = BaseSlot.find_by(meta_slot_id: metaslot.id)
      else
        @slot = BaseSlot.create_slot(meta: meta_params,
                                     visibility: enforce_visibility,
                                     media: media_params, notes: note_param,
                                     alerts: alerts_param, user: slot_creator)
      end

      # Create ReSlot:
      if @slot.errors.empty?
        authorize :reSlot
        @slot = ReSlot.create_from_slot(predecessor: @slot,
                                        slotter: current_user)
        return head :ok if @slot.save
      end
      render json: { error: @slot.errors },
             status: :unprocessable_entity
    end

    # PATCH /v1/metaslot/1
    # TODO: Do we want to keep this?
    def update_metaslot
      @meta_slot = current_user.created_slots.find(params[:id])
      authorize @meta_slot

      if @meta_slot.update(meta_params)
        head :no_content
      else
        render json: @meta_slot.errors, status: :unprocessable_entity
      end
    end

    # PATCH /v1/stdslot/1
    def update_stdslot
      @slot = current_user.std_slots.find(params[:id])
      authorize @slot

      @slot.update_from_params(meta: meta_params, visibility: visibility,
                               media: media_params, notes: note_param,
                               alerts: alerts_param, user: current_user)

      if @slot.errors.empty?
        render :show, locals: { slot: @slot }
      else
        render json: @slot.errors.messages, status: :unprocessable_entity
      end
    end

    # PATCH /v1/groupslot/1
    def update_groupslot
      @slot = current_user.group_slots.find(params[:id])
      authorize @slot

      @slot.update_from_params(meta: meta_params, media: media_params,
                               notes: note_param, alerts: alerts_param,
                               user: current_user)

      if @slot.errors.empty?
        render :show, locals: { slot: @slot }
      else
        render json: @slot.errors.messages, status: :unprocessable_entity
      end
    end

    # PATCH /v1/reslot/1
    def update_reslot
      @slot = current_user.re_slots.find(params[:id])
      authorize @slot

      # TODO: this should only be allowed for tagged users
      @slot.parent.update_from_params(media: media_params, notes: note_param,
                                      user: current_user)
      @slot.update_from_params(alerts: alerts_param, user: current_user)

      if @slot.errors.empty?
        render :show, locals: { slot: @slot }
      else
        render json: @slot.errors.messages, status: :unprocessable_entity
      end
    end

    # DELETE /v1/std_slot/1
    def destroy_stdslot
      @slot = current_user.std_slots.find(params[:id])
      authorize @slot

      if @slot.delete
        render :create, locals: { slot: @slot }
      else
        render json: { error: @slot.errors },
               status: :unprocessable_entity
      end
    end

    # DELETE /v1/group_slot/1
    def destroy_groupslot
      @slot = current_user.group_slots.find(params.require(:id))
      authorize @slot

      if @slot.delete
        render :show, locals: { slot: @slot }
      else
        render json: { error: @slot.errors },
               status: :unprocessable_entity
      end
    end

    # DELETE /v1/re_slot/1
    def destroy_reslot
      @slot = current_user.re_slots.find(params.require(:id))
      authorize @slot

      if @slot.delete
        render :create, locals: { slot: @slot }
      else
        render json: { error: @slot.errors },
               status: :unprocessable_entity
      end
    end

    # GET /v1/slots/1/share
    def share_url
      @slot = BaseSlot.get(params[:id])
      authorize @slot

      if @slot.set_share_id(current_user)
        render :show, locals: { slot: @slot }
      else
        render json: @slot.errors.messages, status: :unprocessable_entity
      end
    end

    # GET /v1/slots/abcd1234/sharedata
    def share_data
      @slot = BaseSlot.find_by(share_id: params[:uid])
      authorize @slot

      render :sharedata, locals: { slot: @slot }
    end

    # POST /v1/slots/1/like
    def add_like
      @slot = BaseSlot.get(params[:id])
      authorize @slot
      @slot.create_like current_user

      head :ok
    end

    # DELETE /v1/slots/1/like
    def unlike
      @slot = BaseSlot.get(params[:id])
      authorize @slot
      @slot.destroy_like current_user

      head :ok
    end

    # GET /v1/slots/1/likes
    def show_likes
      @slot = BaseSlot.get(params[:id])
      authorize @slot

      render :likes
    end

    # POST /v1/slots/1/comment
    def add_comment
      @slot = BaseSlot.get(params[:id])
      authorize @slot
      @slot.create_comment(current_user, comment_param)

      head :ok
    end

    # GET /v1/slots/1/comments
    def show_comments
      @slot = BaseSlot.get(params[:id])
      authorize @slot

      render :comments
    end

    # GET /v1/slots/1/slotters
    def show_slotters
      @slot = BaseSlot.get(params[:id])
      authorize @slot

      render :slotters
    end

    # GET /v1/slots/1/history
    def reslot_history
      @slot = BaseSlot.get(params[:id])
      authorize @slot

      render :reslot_history
    end

    # POST /v1/slots/1/copy
    def copy
      @slot = BaseSlot.get(params[:id])
      authorize @slot
      @slot.copy_to(copy_params, current_user)

      head :ok
      # TODO: return the newly generated slots
    end

    # POST /v1/slots/1/move
    def move
      old_slot = BaseSlot.get(params[:id])
      authorize old_slot
      new_slot = old_slot.move_to(move_params, current_user)

      render :show, locals: { slot: new_slot }
    end

    private def group
      Group.find(params.require(:groupId))
    end

    private def enforce_visibility
      params.require :visibility
      visibility
    end

    private def visibility
      return nil unless params.key? :visibility

      visibility = params[:visibility]
      valid_values = %w(private friends foaf public)

      unless valid_values.include? visibility
        fail ActionController::ParameterMissing,
             "visibility must be one of #{valid_values}"
      end
      visibility
    end

    private def re_params
      params.require(:predecessorId)
    end

    private def meta_params
      # only the slot creator can update the meta params
      # TODO: groupslots need special treatment
      return {} if @slot && current_user != @slot.creator

      # Check validity of date format
      # metaSlotId is (IMHO only) requiered for copy slot
      p = params.permit(:title, :startDate, :endDate, :metaSlotId,
                        location:
                          [:name, :thoroughfare, :subThoroughfare,
                           :locality, :subLocality, :administrativeArea,
                           :subAdministrativeArea, :postalCode, :country,
                           :isoCountryCode, :inLandWater, :ocean, :latitude,
                           :longitude, :privateLocation, :areasOfInterest])
      # sets iosLocation to the content of params['location']
      p[:iosLocation] = p.delete(:location) if params[:location].present?

      if params.key? :endDate
        if params[:endDate].blank?
          # empty end_date means slot with open_end
          p[:open_end] = true
        else
          # validate submitted end_date
          enddate = (params[:endDate])
          valid_date = Time.zone.parse(enddate)
          fail ParameterInvalid.new(:end_date, enddate) unless valid_date
          # TODO: add spec for open_end
          p[:open_end] = false unless valid_date == @slot.try(:end_date)
        end
      end

      p.deep_transform_keys!(&:underscore)
      p.deep_symbolize_keys
    end

    private def alerts_param
      params[:settings][:alerts] if params[:settings].present?
    end

    private def note_param
      return nil unless params.key? :notes

      note_params = [:id, :title, :content, :localId]
      params[:notes].map do |p|
        note = ActionController::Parameters.new(p.to_hash).permit(note_params)
        note.transform_keys { |key| key.underscore.to_sym }
      end
    end

    private def media_params
      p = params.permit(media: [:publicId,
                                :position,
                                :mediaId,
                                :localId,
                                :creatorId,
                                :mediaType,
                                :title,
                                :duration,
                                :thumbnail])
      p.deep_transform_keys!(&:underscore)
      p.deep_symbolize_keys[:media]
    end

    private def comment_param
      params.require(:content)
    end

    private def copy_params
      target_params = [:slotType, :groupId, :details]
      params.require(:copyTo).map do |p|
        t = ActionController::Parameters.new(p.to_hash).permit(target_params)
        t.transform_keys { |key| key.underscore.to_sym }
      end
    end

    private def move_params
      p = params.permit(:slotType, :groupId, :details)
      p.transform_keys { |key| key.underscore.to_sym }
    end
  end
end
