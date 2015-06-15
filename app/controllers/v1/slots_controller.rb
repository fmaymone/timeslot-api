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

    # POST /v1/stdslot
    def create_stdslot
      authorize :stdSlot
      @slot = BaseSlot.create_slot(meta: meta_params, visibility: visibility,
                                   media: media_params, notes: note_param,
                                   alerts: alerts_param, user: current_user)

      if @slot.errors.empty?
        render :show, status: :created, locals: { slot: @slot }
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
      authorize :reSlot
      predecessor = BaseSlot.find(re_params)

      @slot = ReSlot.create_from_slot(predecessor: predecessor,
                                      slotter: current_user)
      if @slot.save
        render :show, status: :created, locals: { slot: @slot }
      else
        render json: { error: @slot.errors },
               status: :unprocessable_entity
      end
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
      # see policy for thoughts about the different options
      @slot = StdSlot.of(current_user).find(params[:id])
      # @slot = StdSlot.unscoped.find(params[:id])
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

      @slot.parent.update_from_params(media: media_params, notes: note_param)
      @slot.update_from_params(alerts: alerts_param, user: current_user)

      if @slot.errors.empty?
        render :show, locals: { slot: @slot }
      else
        render json: @slot.errors.messages, status: :unprocessable_entity
      end
    end

    # DELETE /v1/std_slot/1
    def destroy_stdslot
      @slot = StdSlot.of(current_user).find(params[:id])
      authorize @slot

      if @slot.delete
        render :show, locals: { slot: @slot }
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
        render :show, locals: { slot: @slot }
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

    private def visibility
      visibility = params.require(:visibility)
      valid_values = %w(private friends public)

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
      if params[:locationId].present? && params[:iosLocation].present?
        msg = "LocationId and IosLocation can not both be submitted"
        fail ActionController::ParameterMissing, msg
      end

      if params[:endDate].present?
        enddate = (params[:endDate])
        valid_date = Time.zone.parse(enddate)
        fail ParameterInvalid.new(:end_date, enddate) unless valid_date
      end

      p = params.permit(:title, :startDate, :endDate, :locationId, :metaSlotId,
                        location:
                          [:name, :thoroughfare, :subThoroughfare,
                           :locality, :subLocality, :administrativeArea,
                           :subAdministrativeArea, :postalCode, :country,
                           :isoCountryCode, :inLandWater, :ocean, :latitude,
                           :longitude, :privateLocation, :areasOfInterest])
      p[:iosLocation] = p.delete(:location) if params[:location].present?
      p.deep_transform_keys!(&:underscore)
      p.deep_symbolize_keys
    end

    private def alerts_param
      params[:settings][:alerts] if params[:settings].present?
    end

    private def note_param
      params.require(:notes) if params[:notes].present?
    end

    private def media_params
      media_params = [:publicId, :position, :mediaId, :localId]
      voice_params = [media_params, :duration].flatten
      video_params = [media_params, :duration, :thumbnail].flatten
      params.permit(photos: media_params, voices: voice_params,
                    videos: video_params)
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
