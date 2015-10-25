class FeedJob
  include SuckerPunch::Job
  workers ENV['NOTIFICATION_WORKERS'] || 5

  # Feed Dispatcher
  #
  # The activities will be distributed to the related feeds
  # through social relations and also handle different type of feeds:
  #
  # 1. User Feed (takes all "me activities" where actor is the current user)
  # 2. Public Feed (activities from friends, groups, reslots, followings),
  #    own activities are not included here as well as activities
  #    related to the current users content
  # 3. Notification Feed (takes all activities which are related to the users content),
  #    own activities are not included here

  def perform(params)
    begin
      # Generates and add activity id (full params are used here)
      params[:id] = Digest::SHA1.hexdigest(params.to_json).upcase
      # Translate class name to enumeration
      params[:feed] = target_types[params[:feed].to_sym]
      # Determine target key for redis set
      target_index = "#{params[:feed]}:#{params[:target]}"
      # Store target to its own index (shared objects)
      $redis.set("Target:#{target_index}", gzip_target(params))
      # Store actor to its own index (shared objects)
      $redis.set("Actor:#{params[:actor]}", gzip_actor(params))

      # Store activity to targets feed (used for "Write-Opt" Strategy)
      # Returns the position of added activity (required for asynchronous access)
      activity_index = $redis.rpush("Feed:#{target_index}", gzip_feed(params)) - 1
      # Determine target index for hybrid "Write-Read-Opt"
      target_key = "#{target_index}:#{activity_index}"

      # Store activity to own feed (me activities)
      $redis.rpush("Feed:#{params[:actor]}:User", target_key)
      # Store activity to own notification feed (related to own content, filter out own activities)
      $redis.rpush("Feed:#{params[:foreignId]}:Notification", target_key) if params[:foreignId] && (params[:actor] != params[:foreignId])

      # Send to other users through social relations ("Read-Opt" Strategy)
      unless params[:notify].empty?
        $redis.pipelined do
          params[:notify].each do |user|
            # Store to others public activity feed
            $redis.rpush("Feed:#{user}:News", target_key)
          end
        end
      end

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

  private

  def gzip_feed(params)
    ActiveSupport::Gzip.compress(
      params.except(:data, :message, :notify)
            .values
            .to_json
    )
  end

  def gzip_actor(params)
    ActiveSupport::Gzip.compress(
      params[:data][:actor].to_json
    )
  end

  def gzip_target(params)
    ActiveSupport::Gzip.compress(
      params[:data][:target].to_json
    )
  end

  def target_types
    {
      StdSlotPrivate: 1,
      StdSlotFriends: 2,
      StdSlotPublic: 3,
      GroupSlotMembers: 4,
      GroupSlotPublic: 5,
      ReSlotFriends: 6,
      ReSlotPublic: 7,
      Group: 8,
      User: 9
    }
  end
end
