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
      actor: activity_actor_id,
      object: activity_object_id,
      target: activity_target_id,
      activity: activity_verb,
      message: activity_message_params,
      foreignId: activity_foreign_id,
      notify: activity_notify,
      time: (activity_time || self.updated_at)
    }.merge!(activity_extra_data))
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
    activity_user ? true : false
  end

  # Indicates on which classname the action was performed (e.g. 'Slot')
  def activity_type
    raise NotImplementedError,
          "Subclasses must define the method 'activity_type'."
  end

  # The user who made the update
  def activity_actor_id
    raise NotImplementedError,
          "Subclasses must define the method 'activity_actor_id'."
  end

  # The object which was updated/created
  def activity_object_id
    raise NotImplementedError,
          "Subclasses must define the method 'activity_object_id'."
  end

  # The object which includes the update as a target
  # We can use this to group/aggregate activities by slots
  def activity_target_id
    raise NotImplementedError,
          "Subclasses must define the method 'activity_target_id'."
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

  # Returns an array of user which should also be notified
  # The official documentation of stream_rails gem is incomplete.
  # A part how to implement aggregations are missing, that's why
  # we have to fall back to the plain ruby way which is also compatible.
  def activity_notify
    raise NotImplementedError,
          "Subclasses must define the method 'activity_notify'."
  end
end
