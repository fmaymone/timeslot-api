require 'sucker_punch/testing/inline'

namespace :feed do
  desc "Seed redis with activities"

  task :build => :environment do

    # Deactivate console logging
    ActiveRecord::Base.logger.level = 1

    # Empty redis storage before start
    $redis.flushall

    # Temporary feed storage
    storage = []

    ## Re-Build Follower Model ##

    Friendship.all.find_each do |relation|
      # friends follows each other
      relation.user.add_follower(relation.friend)
      relation.friend.add_follower(relation.user)
    end

    Membership.all.find_each do |relation|
      relation.group.add_follower(relation.user)
    end

    ReSlot.all.find_each do |slot|
      slot.add_follower(slot.slotter)
    end

    ## Collect Activities ##

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
    # NOTE: Since the redis free plan has a limit of 25 Mb we only rebuild the last 1000 activities
    storage.uniq.sort_by{|a| a[:updated_at]}.last(1000).each(&:create_activity)
  end
end
