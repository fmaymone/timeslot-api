class Feed
  @@enricher = StreamRails::Enrich.new
  mattr_reader :enricher

  def self.user_feed(user_id, params)
    feed = StreamRails.feed_manager.get_user_feed(user_id)
    page = paginate(feed, params)
    enricher.enrich_activities(page)
  end

  def self.news_feed(user_id, params, style = 'aggregated')
    feed = StreamRails.feed_manager.get_news_feeds(user_id)
    page = paginate(feed[style.to_sym], params)
    case style
      when :flat
        enricher.enrich_activities(page)
      else#:aggregated
        enricher.enrich_aggregated_activities(page)
    end
  end

  def self.notification_feed(user_id, params)
    feed = StreamRails.feed_manager.get_notification_feed(user_id)
    page = paginate(feed, params)
    enricher.enrich_activities(page)
  end

  # Cursor based pagination is a lot faster and supported as well.
  # To go with cursor based pagination we have to implement exchanging
  # of page hashes (as cursors) between backend and frontend.
  def self.paginate(feed, limit: 20, offset: 0, cursor: nil)
    (cursor ? feed.get(limit: limit.to_i,
                       id_lt: cursor,
                       mark_seen: true)
            : feed.get(limit: limit.to_i,
                       offset: offset,
                       mark_seen: true)
    )['results']
  end

  def self.slot_as_json(slot)

    user = slot.owner

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
          privateLocation: location_data.private_location,

      }
    end

    # slot creator
    json['creator'] = slot.creator.slice(:id,
                                         :username,
                                         :created_at,
                                         :updated_at,
                                         :deleted_at).as_json.transform_keys { |key| key.camelize(:lower) }
    json['creator']['image'] = {
        publicId: (user.image.try(:public_id) ? user.image.public_id : nil),
        localId: (user.image.try(:local_id) ? user.image.local_id : nil)
    }

    # slot notes
    notes = []

    slot.notes.each do |note|

      notes << {

          id: note.id,
          title: note.title,
          content: note.content,
          localId: note.local_id,
          createdAt: note.created_at
      }

    end

    json['notes'] = notes

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

    # slot settings
    json['settings'] = { alerts: slot.creator.alerts(slot) }
    json['visibility'] = slot.visibility if slot.try(:visibility)

    # slot additionals
    json['groupId'] = slot.group.id if slot.class < GroupSlot

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
      json['shareUrl'] = nil
    else
      json['shareUrl'] = "#{ENV['TS_SLOT_WEBSHARING_URL']}#{slot.share_id}"
    end

    json
  end

  def self.user_as_json(user)
    json = user.slice(:id,
                      :username,
                      :created_at,
                      :updated_at,
                      :deleted_at).as_json.transform_keys { |key| key.camelize(:lower) }
    json['image'] = {
        publicId: (user.image.try(:public_id) ? user.image.public_id : nil),
        localId: (user.image.try(:local_id) ? user.image.local_id : nil)
    }

    json['slotCount'] = user.std_slots.unscoped.count
    json['reslotCount'] = user.re_slots.count
    json['friendsCount'] = user.friends.count

    json
  end
end
