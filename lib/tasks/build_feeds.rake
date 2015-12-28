require 'sucker_punch/testing/inline'

namespace :feed do
  desc "Seed redis with activities"

  task :build => :environment do

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

      Friendship.includes(:user, :friend).all.find_each do |relation|
        # friends follows each other
        if relation.established?
          relation.user.add_follower(relation.friend)
          relation.friend.add_follower(relation.user)
        end
      end

      Membership.includes(:group, :user).all.find_each do |relation|
        if relation.active?
          relation.group.add_follower(relation.user)
        end
      end

      ReSlot.includes(:slotter).all.find_each do |slot|
        slot.add_follower(slot.slotter)
      end

      ## Collect Activities ##

      storage = MediaItem.all +
                Note.all +
                Like.all +
                Comment.all +
                StdSlot.all +
                GroupSlot.all +
                ReSlot.all +
                Friendship.all +
                Membership.all

      # TODO: handle friendship date during re-build task
      # friendship = activity_foreign.present? ? activity_foreign.friendship(activity_actor.id) : nil
      # (visibility != 'friends' || friendship.nil? || Time.zone.parse(self.updated_at.to_s) >= Time.zone.parse(friendship.updated_at.to_s))))

      ## Re-Build Activities ##

      storage.uniq.sort_by!{|a| a[:updated_at]}.last(MAX_ACTIVITIES).each(&:create_activity)

      puts "All feeds was build successfully."
      puts "ACTIVITY COUNT: #{(User.all.count * storage.count)}"
    rescue
      #handle the error here
      puts "An error has occurred during the rebuilding process."
    ensure
      # Turn on push notifications globally
      Rails.application.config.SKIP_PUSH_NOTIFICATION = false
      puts "DISABLE PUSH: #{Rails.application.config.SKIP_PUSH_NOTIFICATION}"
    end
  end
end
