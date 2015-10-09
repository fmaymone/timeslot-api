class FeedJob
  include SuckerPunch::Job
  workers ENV['NOTIFICATION_WORKERS'] || 5

  def perform(params)
    begin
      # Generates activity id
      id = Digest::SHA1.hexdigest(params.to_json).upcase #hexdigest([Time.now, rand].join)
      # Generates group tag
      group = params[:target] + params[:activity] + Time.zone.now.strftime('%Y%m%d')
      # Add identifiers to params
      params.merge!(id: id, group: group)
      # Store to own activities
      $redis.sadd("Feed:#{params[:actor]}:User", user_feed(params))
      # Send to other users through social relations
      unless params[:notify].empty?
        news_params = news_feed(params)
        notification_params = notification_feed(params)
        params[:notify].each_slice(100) do |chunk|
          $redis.multi do
            chunk.each do |user|
              $redis.sadd("Feed:#{user}:News", news_params)
              $redis.sadd("Feed:#{user}:Notification", notification_params)
            end
          end
        end
      end
    rescue => e
      opts = {}
      opts[:parameters] = {
        actor: params[:actor],
        target: params[:target],
        notify: params[:notify],
        sucker_punch: "save to feed failed" }
      Rails.logger.error e
      Airbrake.notify(e, opts)
    end
  end

  def user_feed(params)
    # Stringify json (payload)
    params.except(:notify) #slice(:actor)
          .as_json
          .transform_keys {|key| key.camelize(:lower) }
          .to_json
  end

  def news_feed(params)
    # Stringify json (payload)
    params.except(:notify)
          .as_json
          .transform_keys {|key| key.camelize(:lower) }
          .to_json
  end

  def notification_feed(params)
    # Stringify json (payload)
    params.except(:notify)
          .as_json
          .transform_keys {|key| key.camelize(:lower) }
          .to_json
  end

  # def perform_later(sec, devices, params)
  #   after(sec) { perform(devices, params) }
  # end
end
