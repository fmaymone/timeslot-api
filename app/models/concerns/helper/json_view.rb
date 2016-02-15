module JSONView
  def self.slot(slot)

    return nil unless slot.present?

    # basic slot data
    json = slot.slice(:id,
                      :title,
                      :start_date,
                      :created_at,
                      :updated_at,
                      :deleted_at).as_json.transform_keys { |key| key.camelize(:lower) }

    if slot.open_end == false
      json['endDate'] = slot.end_date
    end

    # slot location
    location_data = if slot.location_uid.nil? && slot.ios_location_id.nil?
                      nil
                    elsif slot.location_uid.nil?
                      slot.ios_location
                    else
                      slot.location
                    end

    if location_data.nil?
      json['location'] = nil
    else
      json['location'] = {
        id: location_data.uuid,
        name: (location_data.name.blank? ? nil : location_data.name),
        thoroughfare: location_data.thoroughfare,
        subThoroughfare: location_data.sub_thoroughfare,
        locality: location_data.locality,
        subLocality: location_data.sub_locality,
        administrativeArea: location_data.administrative_area,
        subAdministrativeArea: location_data.sub_administrative_area,
        postalCode: location_data.postal_code,
        country: location_data.country,
        isoCountryCode: location_data.iso_country_code,
        inLandWater: location_data.in_land_water,
        ocean: location_data.ocean,
        areasOfInterest: location_data.areas_of_interest,
        latitude: location_data.latitude,
        longitude: location_data.longitude,
        # privateLocation: location_data.private_location, # not used so far
      }
    end

    # slot creator
    json['creator'] = self.user(slot.creator)

    # slot notes
    slot_notes = []

    slot.notes.each do |note|
      slot_notes << {
        id: note.id,
        title: note.title,
        content: note.content,
        localId: note.local_id,
        createdAt: note.created_at
      }
    end

    json['notes'] = slot_notes

    # slot media items
    media = []

    slot.media_items.each do |item|

      media_item = {
        mediaId: item.id,
        publicId: item.public_id,
        position: item.position,
        localId: item.local_id,
        mediaType: item.media_type,
        createdAt: item.created_at
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

    # # slot additionals
    json['visibility'] = slot.visibility
    # user must be the current user for alerts
    # json['settings'] = { alerts: user.alerts(slot) }

    json['likes'] = slot.likes_count
    json['commentsCounter'] = slot.comments_count

    json
  end

  def self.group(group)
    json = group.slice(:name, :image,
                       :members_can_post, :members_can_invite,
                       :created_at, :updated_at, :deleted_at
                      ).as_json.transform_keys { |key| key.camelize(:lower) }

    json['id'] = group.uuid
    json['owner'] = self.user(group.owner)
    # json['membershipState'] = current_user.get_membership(group.id).humanize

    json
  end

  def self.user(user, friend = nil)
    json = user.slice(:id,
                      :username,
                      :created_at,
                      :updated_at,
                      :deleted_at).as_json.transform_keys { |key| key.camelize(:lower) }
    json['image'] = {
      publicId: (user.image.try(:public_id) ? user.image.public_id : nil),
      localId: (user.image.try(:local_id) ? user.image.local_id : nil)
    }

    json['slotCount'] = user.visible_slots_counter(friend, StdSlot)
    # json['reslotCount'] = user.visible_slots_counter(friend, ReSlot)
    json['friendsCount'] = user.friends_count

    if friend
      friendship = friend.friendship(user)
      json['friendshipState'] = friendship.nil? ? 'stranger' : friendship.humanize(friend)
    end

    json
  end
end
