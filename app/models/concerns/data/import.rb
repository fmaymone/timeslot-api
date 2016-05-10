module Import
  class << self

    def handler(events, user, group_uuid = nil)
      # Turn of activity distribution
      Rails.application.config.SKIP_ACTIVITY = true
      # Holds all error messages of the whole import job
      failed = []
      # Holds the final status of the whole import job
      status = true

      # NOTE: the import-admin-user is able to create Slots, Calendars and
      # Users during one import, this feature requires a special security
      user_is_admin = user.curator?

      # Import each event
      events.each do |event|

        # TODO: in some imported events from iCal there are text encoding issues
        begin
          next unless event[:title].encode('utf-8').valid_encoding?
        rescue
          failed << event
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
        # Prepare data
        event[:settings] = event[:settings][0]['alerts'] if event[:settings].try(&:any?)

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
                                  alerts: event[:settings])

          slot.ios_location = event[:location] if event[:location]
          status = slot.save && slot.errors.empty? if status
        else
          # Create BaseSlot/MetaSlot
          slot = BaseSlot.create_slot(meta: event_meta,
                                      visibility: event[:visibility],
                                      media: event[:media],
                                      notes: event[:notes],
                                      alerts: event[:settings],
                                      user: creator)

          # FIX: Reload slot to prevent returning a MetaSlot instead of a BaseSlot
          slot.reload
          slot.ios_location = event[:location] if event[:location]
          slot.slot_uuid = event[:uid] if event[:uid].present?
          status = slot.save && slot.errors.empty? if status

          if status
            event[:groups] = [event[:groups]] unless event[:groups].kind_of?(Array)
            event[:groups].each do |group|
              # Create Group
              group = find_or_create_group(creator.id, group || {}, group_uuid)
              status = group.save && group.errors.empty? if status
              # Create Containership Association
              if status
                containership = Containership.find_or_create_by(group: group, slot: slot)
                status = containership.errors.empty? if status
              end
            end
          end
        end
        failed << event unless status
      end
    rescue => error
      error_handler(error, "failed: import from file")
      puts error
      status = false
    ensure
      Rails.application.config.SKIP_ACTIVITY = false
      puts failed if failed.any?
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

    private def find_or_create_group(creator_id, group_params, group_uuid)
      group_params.symbolize_keys! if group_params

      # Find existing group by UID
      if group_uuid
        group = Group.find_by(uuid: group_uuid, owner_id: creator_id)
      elsif group_params[:uuid]
        group = Group.find_by(uuid: group_params[:uuid], owner_id: creator_id)
      else
        group = nil
      end

      # Find or create by meta params
      unless group
        group_params.slice!(:uuid, :name, :image, :public, :description)
        # Find group by meta data
        group = group_params[:name] ? Group.find_by(name: group_params[:name], owner_id: creator_id)
                                    : nil
        if group
          # Update existing group
          group.update(group_params.except(:uuid))
        elsif group_params[:name]
          # Create custom group
          group = Group.create(owner_id: creator_id, **group_params)
        else
          # Create default group
          group = Group.find_or_create_by(owner_id: creator_id, name: 'Imports')
        end
      end
      group
    end

    private def error_handler(error, msg, params = {})
      Rails.logger.error { error }
      Airbrake.notify(msg, params.merge(error: error))
      puts error
    end
  end
end
