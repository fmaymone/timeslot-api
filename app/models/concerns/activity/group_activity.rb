module GroupActivity
  include Activity

  private def activity_is_valid?
    super and active? #and !Rails.env.production?
  end

  private def activity_type
    'Group'
  end

  private def activity_foreign
    activity_target.try(:owner)
  end

  private def activity_visibility
    activity_target.try(:public) ? 'public' : 'private'
  end

  # Add extra data to each activity. The data can be hide
  # from the output when the StreamRails::Enrich is not used.
  private def activity_extra_data
    {
      # We store full slot data to the activity stream.
      # The backend needs no further request on the database.
      target: Feed.render_shared_object(activity_target),
      actor: Feed.render_shared_object(activity_actor),
      foreign: Feed.render_shared_object(activity_foreign)
    }
  end

  # The message is used as a notification message
  # for the users activity feed
  private def activity_message_params
    {
      ACTOR: activity_actor.username,
      NAME: activity_target.name,
      USER: activity_foreign.username
    }
  end
end
