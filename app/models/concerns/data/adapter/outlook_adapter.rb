require 'csv'

class OutlookAdapter < Adapter

  def import
    events = []
    import_file.each do |event|
      @event = event
      events << {
          uid: @event.uid.presence,
          title: event['Subject'],
          start_date: import_event_datetime("#{event['Start_Date']}T#{event['Start_Time']}"),
          end_date: import_event_datetime("#{event['End_Date']}T#{event['End_Time']}"),
          ios_location: import_event_location,
          visibility: import_event_visibility,
          alerts: import_event_alerts,
          media: import_event_media,
          notes: import_event_notes
      }
    end
    events
  end

  def export
    # Add csv header
    data = %w(Subject
              Start_Date
              Start_Time
              End_Date
              End_Time
              All_Day_Event
              Categories
              Show_Time
              Location
              Description)

    @slots.joins(:meta_slot).each do |slot|
      @slot = slot
      # Collect and append csv data
      data << %W(#{slot.title}
                 #{slot.start_date.strftime('%Y-%m-%d')}
                 #{slot.start_date.strftime('%H:%I')}
                 #{slot.end_date.strftime('%Y-%m-%d')}
                 #{slot.end_date.strftime('%H:%I')}
                 FALSE
                 Timeslot
                 #{''}
                 #{export_event_location}
                 #{''})
    end
    data
  end

  ## -- IMPORT HELPERS -- ##

  private def is_valid_event(event)
    event['Subject']    && # has title?
    event['Start_Date'] && # has start_date?
    event['Location']      # has location?
  end

  private def import_file
    events = csv_to_json(
        CSV.parse(@file, headers: true)
           .as_json
    )
    events.delete_if{|event| !is_valid_event(event)}
    events
  end

  private def csv_to_json(csv)
    return [] if csv.count < 2

    csv_header = csv.first.map{|item| item.gsub(' ', '_')}
    csv_struct = []

    csv[1..csv.length].each do |entry|
      csv_entry = {}
      csv_header.each_with_index do |field, index|
        csv_entry[field] = entry[index]
      end
      csv_struct << csv_entry
    end

    csv_struct
  end

  private def import_event_datetime(datetime)
    Time.strptime(datetime, '%m/%d/%y %k:%M:%S')
        .strftime('%Y-%m-%d %H:%I')
  end

  private def import_event_location
    {
        name: @event['Location']
        #TODO: parse iCal location
        #thoroughfare: @event.location,
        #locality: @event.location,
        #postal_code: @event.location,
        #country: @event.location,
        #latitude: '52.527335',
        #longitude: '13.414259',
        #private_location: false
    }
  end

  private def import_event_media
    nil # NOTE: is not supported by Outlook
  end

  private def import_event_notes
    nil # NOTE: is not supported by Outlook
  end

  private def import_event_alerts
    nil # NOTE: is not supported by Outlook
  end

  private def import_event_visibility
    'private' # NOTE: is not supported by Outlook
  end

  ## -- EXPORT HELPERS -- ##

  private def export_event_location
    @slot.ios_location.try(:name)
  end

  private def export_event_media
    nil # NOTE: is not supported by Outlook
  end

  private def export_event_notes
    nil # NOTE: is not supported by Outlook
  end

  private def export_event_alerts
    nil # NOTE: is not supported by Outlook
  end

  private def export_event_visibility
    nil # NOTE: is not supported by Outlook
  end
end
