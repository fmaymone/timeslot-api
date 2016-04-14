require 'sucker_punch/testing/inline'

namespace :feed do

  desc "Clear redis from all activities"
  task clear: :environment do
    $redis.flushall
  end

  desc "Refresh redis cache from all feeds"
  task refresh: :environment do

    begin
      Feed.update_shared_objects(User.all + StdSlot.all + Group.all)
      Feed.refresh_feed_cache(User.all.collect(&:id))
      puts "All feeds cache was successfully refreshed."
    rescue => e
      puts "An error has occurred during the refreshing process: #{e}"
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

      ## Re-Build Follower Model ##

      Friendship.includes(:user, :friend).find_each do |relation|
        # friends follows each other
        if relation.established? && relation.deleted_at.nil?
          relation.user.add_follower(relation.friend)
          relation.friend.add_follower(relation.user)
        end
      end

      Membership.includes(:group, :user).find_each do |relation|
        if relation.active? && relation.deleted_at.nil?
          relation.group.add_follower(relation.user)
        end
      end

      Containership.includes(:group, :slot).find_each do |relation|
        relation.slot.add_follower(relation.group) if relation.deleted_at.nil?
      end

      Passengership.includes(:slot, :user).find_each do |relation|
        relation.slot.add_follower(relation.user) if relation.deleted_at.nil?
      end

      ## Collect Activities ##

      storage = MediaItem.where(deleted_at: nil) +
                Note.where(deleted_at: nil) +
                Like.where(deleted_at: nil) +
                Comment.where(deleted_at: nil) +
                Friendship.where(deleted_at: nil) +
                Membership.where(deleted_at: nil) +
                Containership.where(deleted_at: nil) +
                Passengership.where(deleted_at: nil) +
                # Actually we are collecting all activities from slots (e.g. deletion, visibility change)
                StdSlot.all

      # TODO: handle friendship date during re-build task
      # friendship = activity_foreign.present? ? activity_foreign.friendship(activity_actor.id) : nil
      # (visibility != 'friends' || friendship.nil? || Time.zone.parse(self.updated_at.to_s) >= Time.zone.parse(friendship.updated_at.to_s))))

      ## Re-Build Activities ##

      storage.sort_by(&:created_at).last(MAX_ACTIVITIES).each do |item|
        item.create_activity
        item.create_activity('accept') if item.activity_action == 'friendship'
      end

      puts "The follower model was successfully regenerated."
      puts "All feeds was successfully regenerated."
      puts "ACTIVITY OBJECTS: #{(storage.count)}"
    rescue => e
      #handle the error here
      puts "An error has occurred during the rebuilding process: #{e}"
    ensure
      # Turn on push notifications globally
      Rails.application.config.SKIP_PUSH_NOTIFICATION = false
      puts "DISABLE PUSH: #{Rails.application.config.SKIP_PUSH_NOTIFICATION}"
    end
  end
end
