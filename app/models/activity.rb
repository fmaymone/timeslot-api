class Activity

  def self.slot_as_json(slot, user)

    # basic slot data
    json = slot.slice(:id,
                      :title,
                      :start_date,
                      :created_at,
                      :updated_at,
                      :deleted_at).as_json

    if slot.open_end == false
      json['endDate'] = slot.end_date
    end

    # slot location
    if slot.location_id.nil? && slot.ios_location_id.nil?
      location_data = nil
    elsif slot.location_id.nil?
      location_data = slot.ios_location
    else
      location_data = slot.location
    end

    if location_data.nil?
      json['location'] = nil
    else
      json['location'] = {

        id: location_data.id,
        name: (location_data.name.blank? ? nil : location_data.name),
        thoroughfare: location_data.thoroughfare,
        sub_thoroughfare: location_data.sub_thoroughfare,
        locality: location_data.locality,
        sub_locality: location_data.sub_locality,
        administrative_area: location_data.administrative_area,
        sub_administrative_area: location_data.sub_administrative_area,
        postal_code: location_data.postal_code,
        country: location_data.country,
        iso_country_code: location_data.iso_country_code,
        in_land_water: location_data.in_land_water,
        ocean: location_data.ocean,
        areas_of_interest: location_data.areas_of_interest,
        latitude: location_data.latitude,
        longitude: location_data.longitude,
        private_location: location_data.private_location,
      }
    end

    # slot creator
    json['creator'] = slot.creator.slice(:id,
                                         :username,
                                         :created_at,
                                         :updated_at,
                                         :deleted_at).as_json
    json['creator']['image'] = {
      public_id: (user.image.try(:public_id) ? user.image.public_id : nil),
      local_id: (user.image.try(:local_id) ? user.image.local_id : nil)
    }

    # slot notes
    notes = []

    slot.notes.each do |note|

      notes << {

        id: note.id,
        title: note.title,
        content: note.content,
        local_id: note.local_id,
        created_at: note.created_at
      }

    end

    json['notes'] = notes

    # slot media items
    media = []

    slot.media_items.each do |item|

      media_item = {

        media_id: item.id,
        public_id: item.public_id,
        position: item.position,
        local_id: item.local_id,
        media_type: item.media_type,
        created_at: item.created_at
      }

      if item.media_type == 'audio'
        media_item['duration'] = item.duration
        media_item['title'] = item.title
      elsif item.media_type == 'video'
        media_item['duration'] = item.duration
        media_item['thumbnail'] = item.thumbnail
      end

      media << media_item
    end

    json['media'] = media

    # slot settings
    json['settings'] = { alerts: slot.creator.alerts(slot) }
    json['visibility'] = slot.visibility if slot.try(:visibility)

    # slot additionals
    json['group_id'] = slot.group.id if slot.class < GroupSlot

    if slot.try(:group)
      json['group'] = { id: slot.group.id }
    elsif slot.class == ReSlot
      json['slotter'] = { id: slot.slotter_id }
      json['parent'] = { id: slot.parent_id }
      json['visibility'] = slot.parent.try(:visibility)
    elsif slot.class < StdSlot
      json['reslotsCounter'] = slot.reslot_count
    end

    json['likes'] = slot.likes.count
    json['commentsCounter'] = slot.comments.count

    if slot.share_id.empty?
      json['share_url'] = nil
    else
      json['share_url'] = "#{ENV['TS_SLOT_WEBSHARING_URL']}#{slot.share_id}"
    end

    json.deep_symbolize_keys
  end

end
