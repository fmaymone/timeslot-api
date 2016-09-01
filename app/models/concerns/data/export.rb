module Export
  class << self

    def handler(slots, format)
      case format
      when 'google'
        GoogleAdapter.new(slots: slots).export
      when 'ical'
        IcalAdapter.new(slots: slots).export
      when 'outlook'
        OutlookAdapter.new(slots: slots).export
      when 'timeslot'
        TimeslotAdapter.new(slots: slots).export
      else
        return false
      end
    rescue => error
      error_handler(error, "failed: export to #{format}")
      false
    end

    ## HELPERS ##

    private def error_handler(error, msg, params = {})
      Rails.logger.error { error }
      Airbrake.notify(msg, params.merge(error: error))
    end
  end
end
