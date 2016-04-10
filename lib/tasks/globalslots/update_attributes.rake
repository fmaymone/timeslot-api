namespace :globalslots do
  desc "Updates all attributes of the global slots by refetching."

  task update_attributes: :environment do
    puts "Updating attributes of all (future) global slots by refetching..."
    # Rails.application.eager_load!
    counter = GlobalSlot.count

    GlobalSlot.find_each.with_index do |slot, i|
      puts "#{i}/#{counter} fetch globalslot #{slot.id} (#{slot.title})"
      begin
        candy_store_params = CandyShop.new.slot(slot.muid)
      rescue ActiveRecord::RecordNotFound
        puts "not available anymore..."
        next
      else

        puts "start: #{slot.start_date}, end: #{slot.end_date}"
        slot.update(start_date: candy_store_params[:meta][:start_date])
        slot.update(end_date: candy_store_params[:meta][:end_date])
        puts "start: #{slot.start_date}, end: #{slot.end_date}"

        location = candy_store_params[:meta][:location_uid]
        if location != slot.location_uid
          puts "updating location_muid: #{location}"
          slot.update(location_uid: location)
        end
        unless IosLocation.find_by(uuid: slot.location_uid)
          # ios_params = slot.location.as_json
          ios_params = CandyShop.new.location(slot.location_uid).as_json

          if ios_params[:latitude].present? && ios_params[:longitude].present?
            ios_location = IosLocation.find_by(
              latitude: ios_params[:latitude], longitude: ios_params[:longitude])
          end
          puts "location exists already" if ios_location
          puts "creating new Location for meta_slot #{slot.meta_slot_id}" unless ios_location
          ios_location ||= IosLocation.create(
            ios_params.merge(creator: candy_store_params[:creator]))
          slot.meta_slot.update(ios_location: ios_location)
        end
      end
    end
  end
end
