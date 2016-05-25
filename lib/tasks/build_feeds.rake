require 'sucker_punch/testing/inline'

namespace :feed do

  desc "Clear redis from all activities"
  task clear: :environment do
    $redis.flushall
  end

  desc "Refresh redis cache from all feeds"
  task refresh: :environment do

    begin
      Feed.refresh_cache(User.all.collect(&:id))
      puts "All feeds cache was successfully refreshed."
    rescue => e
      puts "An error has occurred during the refreshing process: #{e}"
    end
  end

  desc "Update shared objects from all feeds"
  task update: :environment do

    begin
      Feed.update_objects(User.all + StdSlot.all + Group.all)
      puts "All shared objects were successfully updated."
    rescue
      puts "An error has occurred during the updating process."
    end
  end

  desc "Seed redis with activities"
  task build: :environment do

    # NOTE: Since the redis free plan has a limit of 25 Mb we only rebuild the last 1000 activities
    MAX_ACTIVITIES = 1000

    # Turn off push notifications globally
    Rails.application.config.SKIP_PUSH_NOTIFICATION = true

    begin

      puts "Rebuilding feeds with a maximum of #{MAX_ACTIVITIES} activities."
      puts "DISABLE PUSH: #{Rails.application.config.SKIP_PUSH_NOTIFICATION}"

      # Deactivate console logging
      ActiveRecord::Base.logger.level = 1

      # Empty redis storage before start
      $redis.flushall

      ## Collect Activities + Associations ##

      storage = Friendship.includes(:user, :friend).where(deleted_at: nil) +
                Membership.includes(:group, :user).where(deleted_at: nil) +
                Containership.includes(:group, :slot).where(deleted_at: nil) +
                Passengership.includes(:slot, :user).where(deleted_at: nil) +
                MediaItem.where(deleted_at: nil).last(MAX_ACTIVITIES / 5) +
                Note.where(deleted_at: nil).last(MAX_ACTIVITIES / 5) +
                Like.where(deleted_at: nil).last(MAX_ACTIVITIES / 2) +
                Comment.where(deleted_at: nil).last(MAX_ACTIVITIES / 2) +
                Group.where(deleted_at: nil).last(MAX_ACTIVITIES / 10) +
                StdSlot.where(deleted_at: nil).last(MAX_ACTIVITIES / 10) +
                GlobalSlot.where(deleted_at: nil).last(MAX_ACTIVITIES / 10)

      ## Re-Build Activities + Follower Model ##

      length = storage.count
      distribution_count = 0

      storage.sort_by(&:created_at).each_with_index do |item, index|
        puts "[#{index}/#{length}] Create Activity: #{item.class.name}@#{item.id}"

        # determine limit (reversed: starting from end)
        should_be_distributed = length - index < MAX_ACTIVITIES

        case item.class
        when Friendship
          if item.established?
            # friends follows each other
            item.user.add_follower(item.friend)
            item.friend.add_follower(item.user)
            item.create_activity('accept') if should_be_distributed
          else
            # restore all open friend requests also if max activities was reached
            item.create_activity unless should_be_distributed
          end
        when Membership
          item.group.add_follower(item.user) if item.active?
        # when Containership
        #   item.slot.add_follower(item.group) # actually not supported
        when Passengership
          item.slot.add_follower(item.user)
        end

        # restore activities unless max activity count was reached
        item.create_activity if should_be_distributed
        distribution_count += item.activity_context.flatten.count
      end

      puts "The follower model was successfully regenerated."
      puts "All feeds was successfully regenerated."
      puts "ACTIVITY OBJECTS: #{length}"
      puts "ACTIVITY RECIPIENTS: #{distribution_count}"
    rescue => e
      puts "An error has occurred during the rebuilding process: #{e}"
    ensure
      # Turn on push notifications globally
      Rails.application.config.SKIP_PUSH_NOTIFICATION = false
      puts "DISABLE PUSH: #{Rails.application.config.SKIP_PUSH_NOTIFICATION}"
    end
  end
end
