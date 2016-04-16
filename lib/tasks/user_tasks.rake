namespace :users do

  desc "Add public and private calendars for existing Users."
  task create_public_and_private_calendar: :environment do
    puts "Going through all Users and create new calendars..."

    # Rails.application.eager_load!

    # Turn off push notifications globally
    Rails.application.config.SKIP_PUSH_NOTIFICATION = true

    begin
      ActiveRecord::Base.transaction do
        user_count = User.count

        User.find_each.with_index do |user, index|
          default_msg = "#{index + 1}/#{user_count} - #{user.username}"

          unless user.basic?
            puts "skipping user #{user.username} with role #{user.role}"
            next
          end

          private_cal_uuid = user.slot_sets['my_private_slots_uuid']

          priv_c = Group.find_or_create_by(uuid: private_cal_uuid) do |calendar|
            calendar.owner = user
            calendar.name = 'My Private Slots'
            calendar.public = false
          end

          public_cal_uuid = user.slot_sets['my_public_slots_uuid']

          pub_c = Group.find_or_create_by(uuid: public_cal_uuid) do |calendar|
            calendar.owner = user
            calendar.name = 'My Public Slots'
            calendar.public = true
          end

          if priv_c.save && pub_c.save
            puts "#{default_msg} calendars created successfully: " \
                 "private calendar: ID #{priv_c.id} - UUID #{priv_c.uuid}, " \
                 "public calendar: ID #{pub_c.id} - UUID #{pub_c.uuid}"
          else
            puts "ERROR - #{default_msg} not created correctly: " \
                 " (#{priv_c.errors.messages}, #{pub_c.errors.messages})"
          end
        end
      end
    rescue => e
      puts "An error has occurred: #{e}"
    ensure
      # Turn on push notifications globally
      Rails.application.config.SKIP_PUSH_NOTIFICATION = false
      puts "ENABLE PUSH: #{Rails.application.config.SKIP_PUSH_NOTIFICATION}"
    end
  end
end
