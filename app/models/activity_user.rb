class ActivityUser < Activity

  self.abstract_class = true

  # The user who made the update
  def activity_actor
    user.id.to_s
  end

  # An activity tag as a verb
  def activity_verb
    self.class.name.downcase
  end

  # The object which was updated/created
  def activity_object
    self.id.to_s
  end

  # The object which includes the update as a target
  # We can use this to group/aggregate activities by slots
  def activity_target
    friend.id.to_s
  end

  # The foreign id is required to find activities for
  # changing we need the user here. If users changes their
  # visiblity, we have to delete activities from stream.
  def activity_foreign_id
  end

  # Add extra data to each activity. The data can be hide
  # from the output when the StreamRails::Enrich is not used.
  def activity_extra_data
  end

  # Returns an array of user which should also be notified
  # The official documentation of stream_rails gem is incomplete.
  # A part how to implement aggregations are missing, that's why
  # we have to fall back to the plain ruby way which is also compatible.
  def activity_notify
  end

  # The message is used as a notification message
  # for the users activity feed
  def activity_message
  end
end
