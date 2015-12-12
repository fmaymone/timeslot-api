class RemoveJob
  include SuckerPunch::Job
  workers ENV['NOTIFICATION_WORKERS'] || 5

  def perform(params, target: nil, user: nil)
    begin
      Feed.remove_item_from_feed(params)
      if target
        Feed.remove_target_from_feed(target: target.id,
                                     feed: params[:feed],
                                     notify: params[:notify])
      end
      if user
        Feed.remove_user_from_feed(user: user,
                                   notify: params[:notify])
      end
    rescue => e
      opts = {}
      opts[:parameters] = {
          object: params[:object],
          target: params[:target],
          sucker_punch: "remove from feed failed"
      }
      Rails.logger.error { e }
      Airbrake.notify(e, opts)
    end
  end

  # def perform_later(sec, devices, params)
  #   after(sec) { perform(devices, params) }
  # end
end
