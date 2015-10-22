class UserActivity < Activity

  self.abstract_class = true

  private

  def activity_friend
    raise NotImplementedError,
          "Subclasses must define the method 'activity_friend'."
  end

  def activity_user
    raise NotImplementedError,
          "Subclasses must define the method 'activity_user'."
  end

  def activity_type
    'User'
  end

  # The object which was updated/created
  def activity_object_id
    self.id
  end

  # The user who made the update
  def activity_actor_id
    activity_user.id.to_s
  end

  # The object which includes the update as a target
  # We can use this to group/aggregate activities by slots
  def activity_target_id
    activity_friend.id.to_s
  end

  # The foreign id is required to find activities for
  # changing we need the user here. If users changes their
  # visiblity, we have to delete activities from stream.
  def activity_foreign_id
    ''
  end

  # Add extra data to each activity. The data can be hide
  # from the output when the StreamRails::Enrich is not used.
  def activity_extra_data
    {
      # We store full slot data to the activity stream.
      # The backend needs no further request on the database.
      target: JSONView.user(activity_friend),
      actor: JSONView.user(activity_user)
    }
  end

  # The message is used as a notification message
  # for the users activity feed
  def activity_message_params
    {
      USER: activity_user.username,
      FRIEND: activity_friend.username
    }
  end

  # Returns an array of user which should also be notified
  # The official documentation of stream_rails gem is incomplete.
  # A part how to implement aggregations are missing, that's why
  # we have to fall back to the plain ruby way which is also compatible.
  def activity_notify
    # TODO: for now we send activities to all users
    if Rails.env.test?
      activity_user.followers # + activity_friend.followers.uniq # -> friends of friends
    else
      # The limit for the to field is 100
      user_ids = User.all.collect(&:id)
      # Remove the user who did the actual comment
      user_ids.delete(activity_user.id)
      user_ids
    end
  end
end
