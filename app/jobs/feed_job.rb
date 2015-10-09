class FeedJob
  include SuckerPunch::Job
  workers ENV['NOTIFICATION_WORKERS'] || 5

  def perform(params)
    begin
      # Generates activity id
      id = Digest::SHA1.hexdigest(params.to_json)
      # Generates group tag
      group = params[:target] << params[:activity] << params[:day]
      # Stringify json as payload
      payload = params.except(:notify)
                      .merge!(id: id, group: group)
                      .as_json
                      .transform_keys {|key| key.camelize(:lower) }
                      .to_json
      # Store to own activities
      $redis.sadd("Feed:#{params[:actor]}:User", payload)
      # Send to other users through social relations
      unless params[:notify].empty?
        params[:notify].each_slice(100) do |chunk|
          $redis.multi do
            chunk.each do |user|
              $redis.sadd("Feed:#{user}:News", payload)
              $redis.sadd("Feed:#{user}:Notification", payload)
            end
          end
        end
      end
    rescue => e
      opts = {}
      opts[:parameters] = {
        user_id: params[:actor],
        notify_count: params[:notify].count,
        sucker_punch: "save to feed failed" }
      Rails.logger.error e
      Airbrake.notify(e, opts)
    end
  end

  # def perform_later(sec, devices, params)
  #   after(sec) { perform(devices, params) }
  # end
end
