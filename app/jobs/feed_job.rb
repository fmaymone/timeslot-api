class FeedJob
  include SuckerPunch::Job
  workers ENV['NOTIFICATION_WORKERS'] || 5

  def perform(params)
    begin
      Feed.dispatch(params)
    rescue => e
      opts = {}
      opts[:parameters] = {
        actor: params[:actor],
        object: params[:object],
        target: params[:target],
        sucker_punch: "save to feed failed"
      }
      Rails.logger.error { e }
      Airbrake.notify(e, opts)
    end
  end

  def remove(params)
    begin
      Feed.remove_from_feed(params) unless params[:notify].nil?
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
