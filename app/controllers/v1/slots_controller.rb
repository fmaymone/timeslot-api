module V1
  class SlotsController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: :show

    # GET /v1/slots/1
    def show
      @slot = BaseSlot.get(params[:id])
      authorize @slot

      render :show, locals: { slot: @slot }
    end

    # POST /v1/slots
    def create
      authorize :stdSlot
      @slot = BaseSlot.create_slot(meta: meta_params,
                                   visibility: enforce_visibility,
                                   media: media_params, notes: note_param,
                                   alerts: alerts_param, user: current_user)

      if params.key?(:slot_groups) && params[:slot_groups].any?
        add_to_slotsets(@slot, params[:slot_groups])
      end

      if @slot.persisted?
        render :create, status: :created, locals: { slot: @slot }
      else
        render json: { error: @slot.errors },
               status: :unprocessable_entity
      end
    end

    # TODO: remove this
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

    # TODO: rename to /v1/slots/:id
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

    # DELETE /v1/slot/1
    def delete
      slot_id = params[:id].to_i
      @slot = current_user.std_slots.find(slot_id)

      authorize @slot

      if @slot.delete
        render :create, locals: { slot: @slot }
      else
        render json: { error: @slot.errors },
               status: :unprocessable_entity
      end
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

    # POST /v1/slots/1/user_tags
    def tag_users
      @slot = BaseSlot.get(params[:id])
      authorize @slot

      UsersToSlotTagger.new(@slot).tag(params[:user_tags])

      head :ok
    end

    # GET /v1/slots/1/user_tags
    def show_tagged_users
      @slot = BaseSlot.get(params[:id])
      authorize @slot

      @users = @slot.tagged_users

      render "v1/users/list"
    end

    # GET /v1/slots/1/comments
    def show_comments
      @slot = BaseSlot.get(params[:id])
      authorize @slot

      render :comments
    end

    # TODO: return hash with array instead of just an array
    # GET /v1/slots/1/slotters
    def show_slotters
      slot = BaseSlot.get(params[:id])
      authorize slot

      # user_ids = Passengership.select(:user_id).where(slot: slot)
      # @slotters = User.where(id: user_ids)
      @slotters = slot.my_calendar_users

      render :slotters
    end

    # GET /v1/slots/1/slotsets
    def slotsets
      slot = BaseSlot.get(params[:id])
      authorize slot

      @slotgroups = current_user.groups & slot.slot_groups

      if current_user.my_calendar_slots.include? slot
        @my_cal_uuid = current_user.slot_sets['my_cal_uuid']
      else
        @my_cal_uuid = false
      end

      render :slotsets, locals: { slot_groups: @slotgroups,
                                  my_cal_uuid: @my_cal_uuid }
    end

    # POST /v1/slots/1/slotsets
    def add_to_groups
      @slot = BaseSlot.get(params[:id])
      authorize @slot

      add_to_slotsets(@slot, params[:slot_groups])

      render :slotgroups, locals: { slot: @slot }
    end

    def remove_from_groups
      @slot = BaseSlot.get(params[:id])
      authorize @slot

      if params[:slot_groups].delete(current_user.slot_sets['my_cal_uuid'])
        current_user.passengerships.find_by(slot: @slot).try(:delete)
      end

      groups = Group.where(uuid: params[:slot_groups])
      groups.each do |group|
        begin
          authorize group, :remove_slot?
          SlotsetManager.new(current_user: current_user).remove!(@slot, group)
        rescue Pundit::NotAuthorizedError,
               TSErrors::SlotGroupDeleted
          @slot.errors.add(:base, group.uuid)
        end
      end

      render :slotgroups, locals: { slot: @slot }
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

    private def enforce_visibility
      params.require :visibility
      visibility
    end

    private def meta_params
      # only the slot creator can update the meta params
      # TODO: this is a policy responsiblity
      return {} if @slot && current_user != @slot.creator

      # Check validity of date format
      # metaSlotId is (IMHO only) requiered for copy slot
      p = params.permit(:title, :start_date, :end_date, :meta_slot_id,
                        location:
                          [:name, :thoroughfare, :sub_thoroughfare,
                           :locality, :sub_locality, :administrative_area,
                           :sub_administrative_area, :postal_code, :country,
                           :iso_country_code, :in_land_water, :ocean, :latitude,
                           :longitude, :private_location, :areas_of_interest])
      # sets iosLocation to the content of params['location']
      p[:ios_location] = p.delete(:location) if params[:location].present?

      if params.key? :end_date
        if params[:end_date].blank?
          # empty end_date means slot with open_end
          p[:open_end] = true
        else
          # validate submitted end_date
          enddate = params[:end_date]
          valid_date = Time.zone.parse(enddate)
          fail ParameterInvalid.new(:end_date, enddate) unless valid_date
          # TODO: add spec for open_end
          p[:open_end] = false unless valid_date == @slot.try(:end_date)
        end
      end

      p.deep_symbolize_keys
    end

    private def alerts_param
      params[:settings][:alerts] if params[:settings].present?
    end

    private def note_param
      return nil unless params.key? :notes

      note_params = [:id, :title, :content, :local_id]
      params[:notes].map do |p|
        note = ActionController::Parameters.new(p.to_hash).permit(note_params)
        note.transform_keys { |key| key.to_sym }
      end
    end

    private def media_params
      return nil unless params.key? :media
      p = params.permit(media: [:public_id,
                                :position,
                                :media_id,
                                :local_id,
                                :creator_id,
                                :media_type,
                                :title,
                                :duration,
                                :thumbnail])
      # p.deep_symbolize_keys[:media]
      p[:media].each(&:symbolize_keys)
    end

    private def comment_param
      params.require(:content)
    end

    private def copy_params
      target_params = [:slot_type, :group_id, :details]
      params.require(:copy_to).map do |p|
        t = ActionController::Parameters.new(p.to_hash).permit(target_params)
        t.symbolize_keys
      end
    end

    private def move_params
      params.permit(:slot_type, :group_id, :details)
    end
  end
end
