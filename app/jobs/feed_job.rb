class FeedJob
  include SuckerPunch::Job
  workers ENV['NOTIFICATION_WORKERS'] || 5

  # Feed Dispatcher
  #
  # The activities will be distributed to the related feeds
  # through social relations and also handle different type of feeds:
  #
  # 1. User Feed (takes all "me activities" where actor is the current user)
  #
  # 2. Public Feed (activities from friends, groups, reslots, followings),
  #    own activities are not included here as well as activities
  #    related to the current users content
  #
  # 3. Notification Feed (takes all activities which are related to the users content),
  #    own activities are not included here

  def perform(params)
    begin
      # Generates and add activity id
      params.merge!(id: Digest::SHA1.hexdigest(params.to_json).upcase)
      # Store target to its own index (shared objects)
      $redis.set("Target:#{params[:type]}:#{params[:target]}", ActiveSupport::Gzip.compress(params[:data][:target].to_json))
      # Store actor to its own index (shared objects)
      $redis.set("Actor:#{params[:actor]}", ActiveSupport::Gzip.compress(params[:data][:actor].to_json))
      # Store activity to own feed (me activities)
      $redis.sadd("Feed:#{params[:actor]}:User", user_feed(params))
      # Store activity to own notification feed (related to own content, filter out own activities)
      $redis.sadd("Feed:#{params[:foreignId]}:Notification", notification_feed(params)) if (params[:foreignId] && !params[:actor].eql?(params[:foreignId]))
      # Store to targets feed ("Write-Opt" Strategy)
      $redis.sadd("Feed:#{params[:type]}:#{params[:target]}", news_feed(params)) unless params[:notify].empty?

      # This is the "Read-Opt" Strategy:
      #
      # Send to other users through social relations
      # unless params[:notify].empty?
      #   news_params = news_feed(params)
      #   # Divide notification list into smaller chunks to handle mass inserts
      #   # to redis through the native bulk wrapper $redis.multi
      #   params[:notify].each_slice(100) do |chunk|
      #     $redis.multi do
      #       chunk.each do |user|
      #         # Store to others public activity feed
      #         $redis.sadd("Feed:#{user}:News", news_params)
      #       end
      #     end
      #   end
      # end

    rescue => e
      opts = {}
      opts[:parameters] = {
        actor: params[:actor],
        object: params[:object],
        target: params[:target],
        notify: params[:notify],
        sucker_punch: "save to feed failed" }
      Rails.logger.error { e }
      Airbrake.notify(e, opts)
    end
  end

  def user_feed(params)
    ActiveSupport::Gzip.compress(
        params.except(:notify, :data, :actor)
            .as_json
            .transform_keys {|key| key.camelize(:lower) }
            .to_json
    )
  end

  def news_feed(params)
    ActiveSupport::Gzip.compress(
        params.except(:notify, :data, :message)
            .as_json
            .transform_keys {|key| key.camelize(:lower) }
            .to_json
    )
  end

  def notification_feed(params)
    ActiveSupport::Gzip.compress(
        params.except(:notify, :data)
            .as_json
            .transform_keys {|key| key.camelize(:lower) }
            .to_json
    )
  end

  # def perform_later(sec, devices, params)
  #   after(sec) { perform(devices, params) }
  # end
end
