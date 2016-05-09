require 'sucker_punch/async_syntax'

class RemoveJob < ActiveJob::Base
  queue_as :dispatch #:default

  def perform(activity: nil, target: nil, user: nil, friends: nil)
    Rails.logger.warn { "SUCKER_PUNCH RemoveJob started" }
    ActiveRecord::Base.connection_pool.with_connection do
      Feed.remove_activity(activity) if activity
      Feed.remove_target(target) if target
      Feed.remove_user(user) if user
      Feed.remove_friends(friends) if friends
    end
  rescue => e
    Rails.logger.error { e }
    Airbrake.notify(e)
    puts e
  ensure
    ActiveRecord::Base.clear_active_connections!
    Rails.logger.warn { "SUCKER_PUNCH RemoveJob done" }
  end
end
