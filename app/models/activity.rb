class Activity < ActiveRecord::Base

  self.abstract_class = true

  include JSONView

  after_touch :create_activity, on: [ :create, :update ]
  after_touch :remove_activity, on: :delete

  # Trigger activities to Activity Stream
  #include StreamRails::Activity
  #as_activity

  # The user who made the update
  def activity_actor
    raise NotImplementedError,
          "Subclasses must define the method 'activity_actor'."
  end

  # An activity tag as a verb
  def activity_verb
    raise NotImplementedError,
          "Subclasses must define the method 'activity_verb'."
  end

  # The object which was updated/created
  def activity_object
    raise NotImplementedError,
          "Subclasses must define the method 'activity_object'."
  end

  # The object which includes the update as a target
  # We can use this to group/aggregate activities by slots
  def activity_target
    raise NotImplementedError,
          "Subclasses must define the method 'activity_target'."
  end

  # The message is used as a notification message
  def activity_message
    raise NotImplementedError,
          "Subclasses must define the method 'activity_message'."
  end

  private def create_activity
    {
        actor: activity_actor,
        activity: activity_verb,
        object: activity_object,
        target: activity_target,
        message: activity_message,
        foreign_id: activity_foreign_id,
        extra_data: activity_extra_data,
        notify: activity_notify
    }
  end

  private def remove_activity
  end
end
