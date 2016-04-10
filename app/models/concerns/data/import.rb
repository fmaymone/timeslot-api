module Import
  class << self

    def handler(events, user, group_uuid = nil)
      # Turn of activity distribution
      Rails.application.config.SKIP_ACTIVITY = true
      # Holds the final status of the whole import job
      status = true

      # NOTE: the import-admin-user is able to create Slots, Calendars and
      # Users during one import, this feature requires a special security
      # TODO: move to env
      user_is_admin = user.email == 'import@timeslot.com'

      # Import each event
      events.each do |event|

        # TODO: in some imported events from iCal there are text encoding issues
        begin
          next unless event[:title].encode('utf-8').valid_encoding?
        rescue
          next
        end

        # Create User
        creator = user_is_admin ? find_or_create_user(event) || user : user
        status = creator.save && creator.errors.empty? if status

        start_date = event[:start_date]
        end_date = event[:end_date]

        # Normalize dates with time zone
        start_date = Time.zone.parse(start_date) #.strftime('%Y-%m-%d %H:%I')
        end_date = Time.zone.parse(end_date) if end_date.presence

        # Set default values if not imported:
        event[:visibility] ||= 'private'

        # Check if slot already exist
        if event[:uid].present?
          existing_slots = BaseSlot.where(slot_uuid: event[:uid])
        else
          existing_slots = BaseSlot.joins(:meta_slot)
                                   .where('meta_slots.creator_id = ?', creator.id)
                                   .where('meta_slots.title = ?', event[:title].to_s)
                                   .where('meta_slots.start_date = ?', start_date)
        end

        event_meta = event.slice(:title, :start_date, :end_date)

        # Update existing slot or create new one
        if existing_slots.any?
          # Actually we edit the last slot, when multiple results are found
          slot = existing_slots.last.reload
          slot.update_from_params(meta: event_meta,
                                  visibility: event[:visibility],
                                  media: event[:media],
                                  notes: event[:notes],
                                  alerts: event[:alerts],
                                  user: slot.creator)

          slot.ios_location = event[:location] if event[:location]
          status = slot.save && slot.errors.empty? if status
        else
          # Create BaseSlot/MetaSlot
          slot = BaseSlot.create_slot(meta: event_meta,
                                      visibility: event[:visibility],
                                      media: event[:media],
                                      notes: event[:notes],
                                      alerts: event[:alerts],
                                      user: creator)

          # FIX: Reload slot to prevent returning a MetaSlot instead of a BaseSlot
          slot.reload
          slot.ios_location = event[:location] if event[:location]
          slot.update(slot_uuid: event[:uid]) if event[:uid].present?
          status = slot.save && slot.errors.empty? if status

          if status
            # Create Group
            group = find_or_create_group(event, creator, group_uuid)
            status = group.save && group.errors.empty? if status

            # Create Containership Association
            if status
              containership = Containership.find_or_create_by(group: group, slot: slot)
              status = containership.errors.empty? if status
            end
          end
        end
        # TODO: collect error messages and return to client
        # break unless status
      end
    rescue => error
      error_handler(error, "failed: import from file")
      status = false
    ensure
      Rails.application.config.SKIP_ACTIVITY = false
      status
    end

    ## HELPERS ##

    private def find_or_create_user(event)
      # Find user by meta data
      creator_params = event[:creator].presence
      creator = creator_params ? User.find_by(email: creator_params[:email])
                               : nil
      if creator
        # Update existing user
        creator.update(username: creator_params[:username],
                       picture: creator_params[:picture])
      elsif creator_params
        # Create custom user
        creator = User.create(creator_params)
      else
        creator = nil
      end
      creator
    end

    private def find_or_create_group(event, creator, group_uuid = nil)
      # Find existing group by UID
      group = group_uuid ? Group.find_by(uuid: group_uuid,
                                         owner: creator) : nil
      # Find or create by meta params
      unless group
        # Find group by meta data
        group_params = event[:group].presence
        group = group_params ? Group.find_by(name: group_params[:name], owner: creator)
                             : nil
        if group
          # Update existing group
          group.update(group_params.slice(:name, :image, :public))
        elsif group_params
          # Create custom group
          group = Group.create(owner: creator, **group_params)
        else
          # Create default group
          group = Group.find_or_create_by(owner: creator,
                                          name: 'Imports')
        end
      end
      group
    end

    private def error_handler(error, msg, params = {})
      Rails.logger.error { error }
      Airbrake.notify(msg, params.merge(error: error))
    end
  end
end
