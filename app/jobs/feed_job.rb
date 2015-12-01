class FeedJob
  include SuckerPunch::Job
  workers ENV['NOTIFICATION_WORKERS'] || 5

  def perform(params)
    begin
      # https://github.com/brandonhilkert/sucker_punch/issues/49#issuecomment-37970487
      # http://stackoverflow.com/questions/17561697/argumenterror-a-copy-of-applicationcontroller-has-been-removed-from-the-module
      # NOTE: The problem only occurs when you don't fully qualify the constant name, so Rails tries looking it up in the ApplicationController namespace.
      # NOTE: This problem only occurs when the config config.cache_classes is set to false.
      # 'Feed'.constantize.dispatch(params)
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

  # def perform_later(sec, devices, params)
  #   after(sec) { perform(devices, params) }
  # end
end
