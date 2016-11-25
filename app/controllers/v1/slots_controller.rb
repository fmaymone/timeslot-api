module V1
  class SlotsController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: :show

    # GET /v1/slots/1
    def show
      @slot = BaseSlot.get(params[:id])
      authorize @slot

      render :show, locals: { slot: @slot }
    end

    # so this is getting funny
    # a slot can be created by sending a visibility param (old way) or sending
    # slotgroup/calendar uuids, which then would be used to evaluate the slot
    # visibility (new way). If both parameters are send, 'public' wins, which
    # means if visibility is submitted as 'public', but no public group uuid,
    # the slot will be public anyway. Also if 'private' is submitted, but also
    # a public group uuid, the slot will be public (intermediate way).
    # A slot will always be put into a group. If none is submitted it will be
    # put in the users 'private' or 'public' slots group. The my_cal_uuid and
    # the my_friend_slots_uuid are not treated as valid groups, so the slot
    # will be put into 'private' or 'public' also.
    # POST /v1/slots
    def create
      authorize :stdSlot
      @slot = BaseSlot.create_slot(meta: meta_params, visibility: 'private',
                                   media: media_params, notes: note_param,
                                   description: params[:description],
                                   alerts: alerts_param, user: current_user)

      if @slot.persisted?
        slot_visibility = visibility
        slot_sets = valid_slotset_uuids

        # take submitted visibility into account to maintain backward compatibility
        adjust_slot_visibility(@slot, slot_visibility, slot_sets) if slot_visibility
        add_to_slotsets(@slot, slot_sets) if slot_sets
        add_to_default_slotgroups(@slot, slot_sets)
        @slot.create_activity

        render :create, status: :created, locals: { slot: @slot }
      else
        render json: { error: @slot.errors },
               status: :unprocessable_entity
      end
    end

    private def add_to_default_slotgroups(slot, sets)
      # in case the slot is not put into any group (or only my_calendar or
      # my_friend_slots - which are no real groups) we want to put it in
      # either the users public or private calendar.
      # ASK: vielleicht soll der schedule auch als kalender gelten
      real_groups = sets - [current_user.my_friend_slots_uuid,
                            current_user.my_cal_uuid] if sets

      return unless real_groups.blank?

      service = SlotsetManager.new(current_user: current_user)

      if slot.visibility == 'public'
        uuid = current_user.my_public_slots_uuid
        public_group = Group.find_by uuid: uuid
        service.add!(slot, public_group)
      else
        uuid = current_user.my_private_slots_uuid
        private_group = Group.find_by uuid: uuid
        service.add!(slot, private_group)
      end
    end

    private def adjust_slot_visibility(slot, visibility, sets)
      service = SlotsetManager.new(current_user: current_user)
      service.adjust_visibility(slot, visibility, sets)
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

    # PATCH /v1/slots/1
    def update
      @slot = current_user.std_slots.find(params[:id])
      authorize @slot

      @slot.update_from_params(meta: meta_params,
                               media: media_params, notes: note_param,
                               description: params[:description],
                               alerts: alerts_param, user: current_user)

      if @slot.errors.empty?
        render :show, locals: { slot: @slot }
      else
        render json: @slot.errors.messages, status: :unprocessable_entity
      end
    end

    # TODO: deprecated, remove this at some point
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

    # DELETE /v1/slot/1/media
    def delete_media
      slot_id = params.require(:id).to_i
      media_ids = params.require(:media).map(&:values)
      @slot = current_user.std_slots.find(slot_id)

      authorize @slot
      @slot.media_items.find(media_ids).each(&:delete)

      if @slot.errors.empty?
        head :ok
      else
        render json: { error: @slot.errors },
               status: :unprocessable_entity
      end
    end

    # DELETE /v1/slot/1/notes
    def delete_notes
      slot_id = params.require(:id).to_i
      note_ids = params.require(:notes).map(&:values)
      @slot = current_user.std_slots.find(slot_id)

      authorize @slot
      @slot.notes.find(note_ids).each(&:delete)

      if @slot.errors.empty?
        head :ok
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

      UsersToSlotTagger.new(@slot).tag(params[:user_tags], current_user)

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
      @slotters = slot.my_calendar_users - [slot.creator]

      render :slotters
    end

    # GET /v1/slots/1/slotsets
    # TODO: refactor
    def slotsets
      slot = BaseSlot.get(params[:id])
      authorize slot

      @slotgroups = current_user.groups & slot.slot_groups

      @my_cal_uuid = if current_user.my_calendar_slots.include? slot
                       current_user.my_cal_uuid
                     else
                       false
                     end

      @share_with_friends = if (slot.class < StdSlot) && slot.share_with_friends?
                              current_user.my_friend_slots_uuid
                            else
                              false
                            end

      render :slotsets, locals: { slot_groups: @slotgroups,
                                  my_cal_uuid: @my_cal_uuid,
                                  share_with_friends: @share_with_friends }
    end

    # POST /v1/slots/1/slotgroups
    def add_to_groups
      @slot = BaseSlot.get(params[:id])
      authorize @slot

      add_to_slotsets(@slot, params.require(:slot_groups))

      render :slotgroups, locals: { slot: @slot }
    end

    # DELETE /v1/slots/1/slotgroups
    def remove_from_groups
      @slot = BaseSlot.get(params[:id])
      authorize @slot

      # TODO: update spec
      if params.require(:slot_groups).delete(current_user.my_cal_uuid)
        # current_user.passengerships.find_by(slot: @slot).try(:delete)
        current_user.passengerships.find_by(slot: @slot).hide_from_my_schedule
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
      p = params.permit(:title, :start_date, :end_date, :rrule, :meta_slot_id,
                        location:
                          [:name, :thoroughfare, :sub_thoroughfare,
                           :locality, :sub_locality, :administrative_area,
                           :sub_administrative_area, :postal_code, :country,
                           :iso_country_code, :in_land_water, :ocean, :latitude,
                           :longitude, :private_location, :areas_of_interest,
                           :place_id])
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

    # returns array of valid uuids or nil
    private def valid_slotset_uuids
      valid_slot_group_uuids? ? params[:slot_groups] : nil
    end

    # returns error for if array contains an invalid uuid
    private def valid_slot_group_uuids?
      return false unless params.key?(:slot_groups) &&
                          params[:slot_groups].present?
      params[:slot_groups].each do |uuid|
        valid_uuid = !(uuid =~ /[0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12}/i).nil?
        raise ParameterInvalid.new(:slot_group, uuid) unless valid_uuid
      end
    end
  end
end
