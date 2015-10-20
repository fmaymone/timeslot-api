class FeedJob
  include SuckerPunch::Job
  workers ENV['NOTIFICATION_WORKERS'] || 5

  def perform(params)
    begin
      # Generates and add activity id
      params.merge!(id: Digest::SHA1.hexdigest(params.to_json).upcase)
      # Store to own activity feed (me activities)
      $redis.sadd("Feed:#{params[:actor]}:User", user_feed(params))
      # Store to own notification feed (related to own content, filter out own activities)
      $redis.sadd("Feed:#{params[:foreignId]}:Notification", notification_feed(params)) if (params[:foreignId] && !params[:actor].eql?(params[:foreignId]))
      # Send to other users through social relations
      unless params[:notify].empty?
        news_params = news_feed(params)
        # Divide notification list into smaller chunks to handle mass inserts
        # to redis through the native bulk wrapper $redis.multi
        params[:notify].each_slice(100) do |chunk|
          $redis.multi do
            chunk.each do |user|
              # Store to others public activity feed
              $redis.sadd("Feed:#{user}:News", news_params)
            end
          end
        end
      end
    rescue => e
      opts = {}
      opts[:parameters] = {
        actor: params[:actor],
        object: params[:object],
        target: params[:target],
        notify: params[:notify],
        sucker_punch: "save to feed failed" }
      Rails.logger.error e
      Airbrake.notify(e, opts)
    end
  end

  def user_feed(params)
    params.except(:notify, :slot, :user, :actor)
          .as_json
          .transform_keys {|key| key.camelize(:lower) }
          .to_json
  end

  def news_feed(params)
    params.except(:notify, :message)
          .as_json
          .transform_keys {|key| key.camelize(:lower) }
          .to_json
  end

  def notification_feed(params)
    params.except(:notify, :slot, :user)
          .as_json
          .transform_keys {|key| key.camelize(:lower) }
          .to_json
  end

  # def perform_later(sec, devices, params)
  #   after(sec) { perform(devices, params) }
  # end
end
