require 'sucker_punch/testing/inline'

namespace :redis do
  desc "Seed redis with activities"

  task :seed => :environment do

    # Deactivate console logging
    ActiveRecord::Base.logger.level = 1

    # Delete redis storage before start
    $redis.flushall

    # Temporary feed storage
    storage = []

    # Collect Activities #

    MediaItem.all.find_each do |media|
      storage << media
    end

    Note.all.find_each do |note|
      storage << note
    end

    Like.all.find_each do |like|
      storage << like
    end

    Comment.all.find_each do |comment|
      storage << comment
    end

    StdSlot.all.find_each do |slot|
      storage << slot
    end

    GroupSlot.all.find_each do |slot|
      storage << slot
    end

    ReSlot.all.find_each do |slot|
      storage << slot
    end

    Friendship.all.find_each do |friend|
      storage << friend
    end

    Membership.all.find_each do |member|
      storage << member
    end

    # Re-Build Activities #

    storage.uniq.sort_by{|a| a[:updated_at]}.each(&:create_activity)
  end
end
