require 'sucker_punch/testing/inline'

namespace :redis do
  desc "Seed redis with activities"

  task :seed => :environment do

    # delete redis storage before start
    $redis.flushall

    storage = []

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

    storage.uniq.sort_by{|a| a[:updated_at]}.each do |item|
      item.create_activity
    end
  end
end
