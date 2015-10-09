class Activity < ActiveRecord::Base

  self.abstract_class = true

  include JSONView

  # Trigger activities to Activity Stream
  after_create :create_activity
  after_update :update_activity
  after_destroy :remove_activity

  private def create_activity
    FeedJob.new.async.perform({
      class: activity_class,
      actor: activity_actor,
      activity: activity_verb,
      object: activity_object,
      target: activity_target,
      message: activity_message,
      foreign_id: activity_foreign_id,
      notify: activity_notify,
      time: Time.zone.now #Time.zone.now.strftime('%Y%m%d%H%M%S')
    }.merge!(activity_extra_data))
  end

  private def update_activity
  end

  private def remove_activity
  end

  private def activity_class
    raise NotImplementedError,
          "Subclasses must define the method 'activity_class'."
  end

  # The user who made the update
  private def activity_actor
    raise NotImplementedError,
          "Subclasses must define the method 'activity_actor'."
  end

  # An activity tag as a verb
  private def activity_verb
    raise NotImplementedError,
          "Subclasses must define the method 'activity_verb'."
  end

  # The object which was updated/created
  private def activity_object
    raise NotImplementedError,
          "Subclasses must define the method 'activity_object'."
  end

  # The object which includes the update as a target
  # We can use this to group/aggregate activities by slots
  private def activity_target
    raise NotImplementedError,
          "Subclasses must define the method 'activity_target'."
  end

  # The message is used as a notification message
  private def activity_message
    raise NotImplementedError,
          "Subclasses must define the method 'activity_message'."
  end

  private def activity_notify
    raise NotImplementedError,
          "Subclasses must define the method 'activity_notify'."
  end
end
