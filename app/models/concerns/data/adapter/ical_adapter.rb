class IcalAdapter < Adapter

  def import
    events = []
    import_file.each do |event|
      @event = event
      events << {
          uid: event.uid,
          title: event.summary.first(60), #.force_encoding('iso-8859-1').encode('utf-8'),
          start_date: event.dtstart.to_s,
          end_date: event.dtend.to_s,
          ios_location: import_event_location,
          visibility: import_event_visibility,
          alerts: import_event_alerts,
          media: import_event_media,
          notes: import_event_notes,
      }
    end
    events
  end

  def export
    cal = Icalendar::Calendar.new
    @slots.joins(:meta_slot).each do |slot|
      @slot = slot
      cal.event do |e|
        e.summary     = @slot.title
        e.ip_class    = export_event_visibility
        e.dtstart     = Icalendar::Values::DateTime.new(@slot.start_date)
        e.dtend       = @slot.end_date ? Icalendar::Values::DateTime.new(@slot.end_date) : nil
        e.description = ""
        e.location    = export_event_location
        # e.url       = 'https://example.com'
        # TODO: alarm settings
        # e.alarm do |a|
        #   a.action  = "DISPLAY" # by default
        #   a.summary = "Test Alarm Notification"
        #   a.trigger = "-P1DT0H0M0S" # 1 day before event starts
        # end
      end
    end
    cal.publish
    cal.to_ical
  end

  ## -- IMPORT HELPERS -- ##

  private def is_valid_event(event)
    event.try(:summary).present? && # has title?
    event.try(:dtstart).present?    # has start_date?
  end

  private def import_file(freebusys: false, todos: true, journals: false)
    events = []

    Icalendar.parse(@file).each do |cal|
      events += cal.events    # by default
      events += cal.freebusys if(freebusys)
      events += cal.todos     if(todos)
      events += cal.journals  if(journals)
    end

    events.delete_if{|event| !is_valid_event(event)}
    events
  end

  private def import_event_location
    @event.location.present? ? {
        name: @event.location.gsub!("\n", ', ')
        #TODO: parse iCal location
        #thoroughfare: @event.location,
        #locality: @event.location,
        #postal_code: @event.location,
        #country: @event.location,
        #latitude: '52.527335',
        #longitude: '13.414259',
        #private_location: false
    } : nil
  end

  private def import_event_media
    nil # TODO?
  end

  private def import_event_notes
    if @event.description.present?
      [{
          title: 'Description',
          content: @event.description
      }]
    else
      nil
    end
  end

  private def import_event_alerts
    nil # TODO?
  end

  private def import_event_visibility
    visibility = @event.try(:ip_class)
    visibility ? visibility.downcase : 'private'
  end

  ## -- EXPORT HELPERS -- ##

  private def export_event_location
    @slot.ios_location.try(:name)
  end

  private def export_event_media
    nil # TODO?
  end

  private def export_event_notes
    nil # TODO?
  end

  private def export_event_alerts
    nil # TODO?
  end

  private def export_event_visibility
    @slot.visibility.upcase
  end
end
