module V1
  class GlobalSlotsController < ApplicationController
    # POST /v1/globalslots/reslot
    def create_reslot
      authorize GlobalSlot.new

      muid = global_reslot_params[:predecessor]
      global_slot = GlobalSlot.find_or_create(muid)
      add_to_slotsets(global_slot, params[:slot_groups])

      if global_slot.persisted?
        render "v1/slots/create", status: :created, locals: { slot: global_slot }
      else
        render json: { error: global_slot.errors }, status: :unprocessable_entity
      end
    end

    private def global_reslot_params
      params.require(:predecessor)
      uuids = params.require(:slot_groups)

      raise ParameterInvalid.new(:slot_group, uuid) unless uuids.any?
      raise ActionController::ParameterMissing,
            "no authorized slotgroup submitted" unless authorized_groups? uuids
      params
    end

    # this is kind-of a policy
    # check if at least one submitted group is authorized
    private def authorized_groups?(uuids)
      uuids.each do |slot_group_uuid|
        group = Group.find_by uuid: slot_group_uuid
        next unless group && group.deleted_at.nil?

        return true if current_user == group.owner
        next unless group.members_can_post
        return true if current_user.active_member? group
      end
      false
    end
  end
end
