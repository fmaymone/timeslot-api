namespace :globalslots do
  desc "Updates the Location_uid of the global slots by refetching."

  task update_location: :environment do
    puts "Updating location_uid of all global slots by refetching..."
    # Rails.application.eager_load!

    GlobalSlot.find_each do |slot|
      puts "fetch globalslot #{slot.id} (#{slot.title})"
      begin
        candy_store_params = GlobalSlotConsumer.new.slot(slot.muid)
      rescue ActiveRecord::RecordNotFound
        next
      else
        location = candy_store_params[:meta][:location_uid]
        if location != slot.location_uid
          puts "updating location_muid: #{location}"
          slot.update(location_uid: location)
        end
      end
    end
  end
end
