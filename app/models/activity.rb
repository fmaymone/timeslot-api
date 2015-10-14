class Activity < ActiveRecord::Base

  self.abstract_class = true

  # Trigger activities to feeds
  after_create :create_activity
  after_update :update_activity
  after_destroy :remove_activity

  private

  def create_activity
    FeedJob.new.async.perform({
      type: activity_type,
      actor: activity_actor_id,
      object: activity_object_id,
      target: activity_target_id,
      activity: activity_verb,
      message: activity_message,
      foreign_id: activity_foreign_id,
      notify: activity_notify,
      time: Time.zone.now
    }.merge!(activity_extra_data))
  end

  def update_activity
    # TODO
  end

  def remove_activity
    # TODO
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
  def activity_message
    raise NotImplementedError,
          "Subclasses must define the method 'activity_message'."
  end

  # The message is used as a notification message
  # for the users activity feed
  def activity_notify
    raise NotImplementedError,
          "Subclasses must define the method 'activity_notify'."
  end
end
