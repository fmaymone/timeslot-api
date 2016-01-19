class RemoveJob
  include SuckerPunch::Job
  workers ENV['NOTIFICATION_WORKERS'] || 5

  def perform(params, target: nil, user_targets: nil)
    Feed.remove_item_from_feed(params)
    if target
      Feed.remove_target_from_feeds(target: target['id'],
                                    type: params[:type],
                                    notify: params[:notify])
    end
    if user_targets
      user_targets.each do |target|
        Feed.remove_target_from_feeds(target)
      end
    end
  rescue => e
    opts = {
      object: params[:object],
      target: params[:target],
      sucker_punch: "remove from feed failed"
    }
    Rails.logger.error { e }
    Airbrake.notify(e, opts)
  end

  # def perform_later(sec, devices, params)
  #   after(sec) { perform(devices, params) }
  # end
end
