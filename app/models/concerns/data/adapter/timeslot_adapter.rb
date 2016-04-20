class TimeslotAdapter < Adapter

  def import
    events = []
    import_file.each do |event|
      @event = event
      events << {
          uid: event['uid'],
          title: event['title'].size > 60 ? event['title'][0..59] : event['title'],
          start_date: event['start'],
          end_date: event['end'],
          location: import_event_location,
          visibility: import_event_visibility,
          alerts: import_event_alerts,
          media: import_event_media,
          notes: import_event_notes,
          creator: import_event_creator,
          group: import_event_group
      }
    end
    events
  end

  # TODO: export media items, notes, alerts, settings
  def export
    cal = []
    @slots.joins(:meta_slot).each do |slot|
      #slot.reload
      cal << {
          # Slot Meta Data
          uid: slot.slot_uuid,
          title: slot.title,
          visibility: slot.visibility,
          start: slot.start_date,
          end: slot.end_date || '',
          # Location Meta Data
          location: slot.ios_location.nil? ? nil : {
              name: slot.ios_location.name || '',
              country: slot.ios_location.country || '',
              postalcode: slot.ios_location.postal_code || '',
              city: slot.ios_location.locality || '',
              address: slot.ios_location.thoroughfare || '',
              latitude: slot.ios_location.latitude || '',
              longitude: slot.ios_location.longitude || ''
          }
      }
    end
    cal.to_json
  end

  ## -- IMPORT HELPERS -- ##

  private def is_valid_event(event)
    event['title'].present? &&
    event['user'].present? || event['group'].present? &&
    event['start_time'].present?
  end

  private def import_file
    events = JSON.parse(@file)
    events.delete_if{|event| !is_valid_event(event)}
    events
  end

  private def import_event_location
    location = @event['location']
    location ? {
        name: location['name'].presence,
        thoroughfare: location['address'].presence,
        locality: location['city'].presence,
        postal_code: location['postalcode'].presence,
        country: location['country'].presence,
        latitude: location['latitude'].presence,
        longitude: location['longitude'].presence
    } : {}
  end

  private def import_event_group
    group = @event['group']
    group ? {
        name: group['title'].presence,
        image: group['image_url'].presence,
        public: group['visibility'] == 'public',
    } : {}
  end

  private def import_event_creator
    user = @event['user']
    user ? {
        username: user['username'].presence,
        password: user['password'].presence,
        email: user['email'].presence,
        picture: user['image_url'].presence
    } : {}
  end

  private def import_event_media
    # TODO: export all media items
    [{
        public_id: @event['image_url'].presence,
        local_id: '',
        media_type: 'image',
        position: 0
    }]
  end

  private def import_event_notes
    @event['notes'].presence || nil
  end

  private def import_event_alerts
    nil # TODO
  end

  private def import_event_visibility
    @event['visibility'].presence || 'private'
  end

  ## -- EXPORT HELPERS -- ##

  private def export_event_location
    @slot.ios_location.try(:name)
  end

  private def export_event_media
    @slot.media_items
  end

  private def export_event_notes
    @slot.notes
  end

  private def export_event_alerts
    nil # TODO
  end

  private def export_event_visibility
    @slot.visibility.upcase
  end
end
