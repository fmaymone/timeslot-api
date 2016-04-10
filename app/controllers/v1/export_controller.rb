module V1
  class ExportController < ApplicationController

    def ical
      authorize :export
      slots = get_slots_from_group

      export = Export.handler(slots, 'ical')
      export ? send_data(export, filename: create_filename('ical'))
             : :err
    end

    def google
      authorize :export
      slots = get_slots_from_group

      export = Export.handler(slots, 'google')
      export ? send_data(export, filename: create_filename('ical'))
             : :err
    end

    def outlook
      authorize :export
      slots = get_slots_from_group

      export = Export.handler(slots, 'outlook')
      export ? send_data(export, filename: create_filename('csv'))
             : :err
    end

    def timeslot
      authorize :export
      slots = get_slots_from_group

      export = Export.handler(slots, 'timeslot')
      export ? send_data(export, filename: create_filename('json'))
             : :err
    end

    ## HELPERS ##

    private def create_filename(type)
      "#{params[:group] || 'Timeslot-Export'}.#{type}"
    end

    private def get_slots_from_group
      if params[:group].present?
        Group.find_by(params[:group]).slots.where(creator: current_user)
      else
        current_user.std_slots
      end
    end
  end
end
