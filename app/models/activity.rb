class Activity < ActiveRecord::Base

  self.abstract_class = true

  # Trigger activities to Activity Stream
  include StreamRails::Activity
  as_activity

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
end
