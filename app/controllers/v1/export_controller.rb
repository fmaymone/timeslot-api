module V1
  class ExportController < ApplicationController

    # POST /v1/export/ical
    def ical
      authorize :export
      slots = get_slots_from_group || []

      export = Export.handler(slots, 'ical')
      export ? send_data(export, filename: create_filename('ical'))
             : :err
    end

    # POST /v1/export/google
    def google
      authorize :export
      slots = get_slots_from_group || []

      export = Export.handler(slots, 'google')
      export ? send_data(export, filename: create_filename('ical'))
             : :err
    end

    # POST /v1/export/outlook
    def outlook
      authorize :export
      slots = get_slots_from_group || []

      export = Export.handler(slots, 'outlook')
      export ? send_data(export, filename: create_filename('csv'))
             : :err
    end

    # POST /v1/export/timeslot
    def timeslot
      authorize :export
      slots = get_slots_from_group || []

      export = Export.handler(slots, 'timeslot')
      export ? send_data(export, filename: create_filename('json'))
             : :err
    end

    ## HELPERS ##

    private def create_filename(type)
      "#{(params[:group] || 'Timeslot-Export')}.#{type}"
    end

    private def get_slots_from_group
      # NOTE: actually we return only owned Slot by the current user
      if params[:group].present?
        group = Group.find_by(uuid: params[:group], owner: current_user)
        group ? group.slots.where('creator_id = ?', current_user.id) : []
      else
        current_user.std_slots
      end
    end
  end
end
