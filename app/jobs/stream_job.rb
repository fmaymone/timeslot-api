class StreamJob
  include SuckerPunch::Job
  workers ENV['NOTIFICATION_WORKERS'] || 5

  def perform(connections, params)
    # TODO: Stream Job implementation
  end

  # def perform_later(sec, devices, params)
  #   after(sec) { perform(devices, params) }
  # end
end
