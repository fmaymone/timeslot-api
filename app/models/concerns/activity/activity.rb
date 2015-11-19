module Activity
  extend ActiveSupport::Concern

  included do
    # Trigger activities to feeds:
    after_commit :create_activity, on: :create
    after_commit :update_activity, on: :update
    before_destroy :remove_activity
  end

  def create_activity
    # Trigger "create" as an activity if this should be valid
    if activity_is_valid?
      create_activity_feed
      create_activity_stream
      create_activity_push
      create_activity_email
    end
  end

  private

  def create_activity_feed(activity_time = nil)
    begin
      FeedJob.new.async.perform({
        type: activity_type,
        actor: activity_actor.id.to_s,
        object: self.id.to_s,
        target: activity_target.id.to_s,
        activity: activity_verb,
        message: activity_message_params,
        foreignId: (activity_foreign ? activity_foreign.id.to_s : ''),
        notify: activity_notify,
        data: activity_extra_data,
        time: (activity_time || self.updated_at),
        feed: activity_target.class.name
      })
    rescue => error
      opts = {}
      opts[:parameters] = {
          activity: "failed: initialize activity as worker job"
      }
      Rails.logger.error { error }
      Airbrake.notify(error, opts)
    end
  end

  def create_activity_stream
    # TODO
  end

  def create_activity_push
    # TODO
  end

  def create_activity_email
    # TODO
  end

  def update_activity
    # TODO
  end

  def remove_activity
    # TODO:
    # # Remove activities from target feeds:
    # Feed::remove_from_feed(activity_target.class.name, activity_target.id)
    # # Trigger "delete" as an activity if this should be valid
    # # Pass the current time because this before-callback does not trigger "updated_at"
    # create_activity_feed(Time.zone.now) if activity_is_valid?
  end

  # This method should be overridden in the subclass
  # if custom validation is required
  def activity_is_valid?
    activity_actor && activity_target
  end

  # Returns an array of user which should also be notified
  def activity_notify
    # TODO: currently we are sending activities to all users
    # In "real" situation the feed dispatcher collect the related feed
    # through social relations (called: followings), these are also mapped in redis
    # To test the intended logic, we use this temporary switch here
    # This is only for current simulation of a "public activity feed"
    # When the iOS has implemented friends and groups, we can remove this switch
    if Rails.env.test?
      # Test of feed distribution through social relations
      user_ids = activity_target.followers
      # When target belongs to a group we do not notify user followers (e.g. friends)
      if activity_group
        user_ids += activity_group.followers
      elsif activity_actor
        user_ids += activity_actor.followers
      end
      user_ids.uniq!
    else
      # Temporary fallback to simulate a "public activity" feed
      # The limit for the to field is 100
      return [] if activity_actor.email.eql?('info@timeslot.com')
      user_ids = User.all.collect(&:id).map(&:to_s)
    end
    # Remove the user who did the actual comment
    user_ids.delete(activity_actor.id.to_s)
    # Remove if foreignId is similar to the actor
    user_ids.delete(activity_foreign.id.to_s) if activity_foreign && (activity_foreign.id == activity_actor.id)
    user_ids
  end

  # Indicates that the activity target belongs to a group
  def activity_group
    activity_target.try(:group)
  end

  # Indicates on which activity main category the action was performed (e.g. 'Slot')
  def activity_type
      raise NotImplementedError,
            "Subclasses must define the method 'activity_type'."
  end

  # The user who made the update
  def activity_actor
    raise NotImplementedError,
          "Subclasses must define the method 'activity_actor'."
  end

  # The object which includes the update as a target
  # We can use this to group/aggregate activities by slots
  def activity_target
    raise NotImplementedError,
          "Subclasses must define the method 'activity_target'."
  end

  # An activity tag as a verb
  def activity_verb
    raise NotImplementedError,
          "Subclasses must define the method 'activity_verb'."
  end

  # The message is used as a notification message
  def activity_message_params
    raise NotImplementedError,
          "Subclasses must define the method 'activity_message_params'."
  end
end
