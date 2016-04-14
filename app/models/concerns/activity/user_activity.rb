module UserActivity
  include Activity

  private def activity_type
    'User'
  end

  private def activity_foreign
    activity_target
  end

  private def activity_visibility
    'friends' # currently not supported
  end

  # Add extra data to each activity. The data can be hide
  # from the output when the StreamRails::Enrich is not used.
  private def activity_extra_data
    {
      # We store full slot data to the activity stream.
      # The backend needs no further request on the database.
      target: Feed.render_shared_object(activity_target),
      actor: Feed.render_shared_object(activity_actor)
    }
  end

  # The message is used as a notification message
  # for the users activity feed
  private def activity_message_params
    {
      ACTOR: activity_target.username,
      USER: activity_actor.username
    }
  end
end
