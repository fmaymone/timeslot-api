module V1
  class SlotsController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:show, :show_many]

    # GET /v1/slots
    # return all slots (std, group, re) of the current user
    # should almost probably also include slots from friends
    def index
      authorize :slot
      @slots = policy_scope(:slot)

      render :index
    end

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
      @slot = StdSlot.create_with_meta(meta_params, std_param, note_param,
                                       alerts_param, current_user)
      if @slot.errors.empty?
        render :show, status: :created, locals: { slot: @slot }
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    end

    # POST /v1/groupslot
    def create_groupslot
      group = Group.find(group_param)
      authorize GroupSlot.new(group: group)

      @slot = GroupSlot.create_with_meta(meta_params, group_param, note_param,
                                         alerts_param, current_user)
      if @slot.errors.empty?
        render :show, status: :created, locals: { slot: @slot }
      else
        render json: @slot.errors, status: :unprocessable_entity
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
        render json: @slot.errors, status: :unprocessable_entity
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
      @slot = current_user.std_slots.find(params[:id])
      authorize @slot

      @slot.update(std_param) if params["visibility"].present?
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
      @slot = current_user.std_slots.find(params.require(:id))
      authorize @slot

      if @slot.delete
        render :show, locals: { slot: @slot }
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    end

    # DELETE /v1/group_slot/1
    def destroy_groupslot
      @slot = current_user.group_slots.find(params.require(:id))
      authorize @slot

      if @slot.delete
        render :show, locals: { slot: @slot }
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    end

    # DELETE /v1/re_slot/1
    def destroy_reslot
      @slot = current_user.re_slots.find(params.require(:id))
      authorize @slot

      if @slot.delete
        render :show, locals: { slot: @slot }
      else
        render json: @slot.errors, status: :unprocessable_entity
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
    # - target (private_slots, friend_slots, public_slots, groupname)
    # - with_details(media, comments, likes)
    def copy
      @slot = BaseSlot.get(params[:id])
      authorize @slot
      @slot.copy_to(copy_params, current_user)

      head :ok
    end

    # POST /v1/slots/1/move
    # - target (private_slots, friend_slots, public_slots, re_slots, groupname)
    # - with_details(media, comments, likes)
    def move
      old_slot = BaseSlot.get(params[:id])
      authorize old_slot
      new_slot = old_slot.move_to(move_params, current_user)

      render :show, locals: { slot: new_slot }
    end

    private def group_param
      params.require(:groupId)
    end

    private def std_param
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

    private def comment_param
      params.require(:content)
    end

    private def copy_params
      target_params = [:target, :details]
      params.require(:copyTo).map do |p|
        ActionController::Parameters.new(p.to_hash).permit(target_params)
      end
    end

    private def move_params
      params.require(:target)
      params.permit(:target, :details)
    end
  end
end
