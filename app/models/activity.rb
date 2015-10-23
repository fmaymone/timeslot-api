class Activity < ActiveRecord::Base

  self.abstract_class = true

  # Trigger activities to feeds:
  after_commit :create_activity, on: :create
  after_commit :update_activity, on: :update
  before_destroy :remove_activity

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
    FeedJob.new.async.perform({
      type: activity_type,
      actor: activity_actor.id.to_s,
      object: self.id.to_s,
      target: activity_target.id.to_s,
      activity: activity_verb,
      feed: activity_target.class.name,
      message: activity_message_params,
      foreignId: (activity_foreign ? activity_foreign.id.to_s : ''),
      notify: activity_notify,
      data: activity_extra_data,
      time: (activity_time || self.updated_at)
    })
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
    # Remove activities from target feeds:
    Feed::remove_target_from_feed(self, target)
    # Trigger "delete" as an activity if this should be valid
    # Pass the current time because this before-callback does not trigger "updated_at"
    create_activity_feed(Time.zone.now) if activity_is_valid?
  end

  # This method should be overridden in the subclass
  # if custom validation is required
  def activity_is_valid?
    activity_actor && activity_target
  end

  # This method should be overridden in the subclass
  # if custom validation is required
  def activity_notify
    []
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
