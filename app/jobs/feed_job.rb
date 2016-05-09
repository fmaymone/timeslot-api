require 'sucker_punch/async_syntax'

class FeedJob < ActiveJob::Base
  queue_as :dispatch #:default

  def perform(params)
    Rails.logger.warn {
      "SUCKER_PUNCH FeedJob started (#{params[:actor]}: #{params[:action]})"
    }
    Feed.dispatch(params)
  rescue => e
    opts = {
      actor: params[:actor],
      object: params[:object],
      target: params[:target],
      action: params[:action],
      sucker_punch: "save to feed failed"
    }
    Rails.logger.error { e }
    Airbrake.notify(e, opts)
    puts e
  ensure
    Rails.logger.warn {
      "SUCKER_PUNCH FeedJob done (#{params[:actor]}: #{params[:action]})"
    }
  end
end
