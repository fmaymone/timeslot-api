module UserActivity
  include Activity

  private def activity_type
    'User'
  end

  private def activity_foreign
    nil
  end

  private def activity_visibility
    'public' # currently not supported
  end

  private def activity_extra_data
    {
      # We store full slot data to the activity stream.
      # The backend needs no further request on the database.
      target: Feed.render_shared_object(activity_target),
      actor: Feed.render_shared_object(activity_actor)
    }
  end
end
