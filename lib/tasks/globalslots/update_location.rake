namespace :globalslots do
  desc "Updates the Location_uid of the global slots by refetching."

  task update_location: :environment do
    puts "Updating location_uid of all global slots by refetching..."
    # Rails.application.eager_load!
    counter = GlobalSlot.count

    GlobalSlot.find_each.with_index do |slot, i|
      puts "#{i+1}/#{counter} fetch globalslot #{slot.id} (#{slot.title})"
      begin
        candy_store_params = GlobalSlotConsumer.new.slot(slot.muid)
      rescue ActiveRecord::RecordNotFound
        puts "slot not found #{slot.id} - #{slot.title}"
        next
      else
        location = candy_store_params[:meta][:location_uid]
        if location != slot.location_uid
          puts "updating location_muid: #{location}"
          slot.update(location_uid: location)
        end
      ensure
        begin
          location_params = GlobalSlotConsumer.new.location(location)
        rescue ActiveRecord::RecordNotFound
          puts "--> location #{slot.location_uid} not found for slot #{slot.id}"
          next
        else
          next unless slot.ios_location.nil?
          puts "set location..."
          location = location_params.as_json
          new_location = nil
          if location['latitude'].present? && location['longitude'].present?
            new_location = IosLocation.find_by(
              latitude: location['latitude'], longitude: location['longitude'])
          end
          new_location ||= IosLocation.create(location.merge(creator: slot.creator))
          slot.update(ios_location: new_location)
        end
      end
    end
  end
end
