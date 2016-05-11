class TimeslotAdapter < Adapter

  def import
    events = []
    import_file.each do |event|
      @event = event
      events << {
          uid: event['uid'],
          title: event['title'].first(60),
          start_date: event['start'],
          end_date: event['end'],
          location: import_event_location,
          visibility: import_event_visibility,
          settings: import_event_alerts,
          media: import_event_media,
          notes: import_event_notes,
          creator: import_event_creator,
          groups: import_event_groups
      }
    end
    events
  end

  # TODO: export media items, notes, alerts, settings
  def export
    cal = []
    @slots.joins(:meta_slot).each do |slot|
      cal << {
          # Slot Meta Data
          uid: slot.slot_uuid,
          title: slot.title,
          visibility: export_event_visibility(slot),
          start: slot.start_date,
          end: slot.end_date || '',
          # Slot Content
          media: export_event_media(slot),
          notes: export_event_notes(slot),
          # Slot Settings
          settings: export_event_alerts(slot),
          groups: export_event_groups(slot),
          # Location Meta Data
          location: export_event_location(slot)
      }
    end
    cal.to_json
  end

  ## -- IMPORT HELPERS -- ##

  private def is_valid_event(event)
    event['title'].present? &&
    event['uid'].present? &&
    event['start'].present?
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

  private def import_event_groups
    group = @event['group']
    group ? {
        name: group['title'].presence,
        image: group['image_url'].presence || group['image'].presence,
        public: group['visibility'] == 'public',
        description: group['description'].presence
    } : @event['groups'].presence || {}
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
    @event['media'].presence || [{
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
    @event['settings'].presence || nil
  end

  private def import_event_visibility
    @event['visibility'].presence || 'private'
  end

  ## -- EXPORT HELPERS -- ##

  private def export_event_location(slot)
    slot.ios_location.nil? ? nil : {
        name: slot.ios_location.name || '',
        country: slot.ios_location.country || '',
        postalcode: slot.ios_location.postal_code || '',
        city: slot.ios_location.locality || '',
        address: slot.ios_location.thoroughfare || '',
        latitude: slot.ios_location.latitude || '',
        longitude: slot.ios_location.longitude || ''
    }
  end

  private def export_event_media(slot)
    slot.media_items.map{
      |media| media.slice(:public_id, :media_type, :position, :duration, :title)
    }
  end

  private def export_event_notes(slot)
    slot.notes.map{
      |note| note.slice(:title, :content)
    }
  end

  private def export_event_alerts(slot)
    slot.slot_settings.map{
      |setting| setting.slice(:alerts)
    }
  end

  private def export_event_groups(slot)
    slot.slot_groups.where(owner: slot.creator).map{
      |group| group.slice(:uuid, :name, :image, :public, :description)
    }
  end

  private def export_event_visibility(slot)
    slot.visibility
  end
end
