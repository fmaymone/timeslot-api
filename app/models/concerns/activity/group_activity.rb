module GroupActivity
  include Activity

  private def activity_type
    'Group'
  end

  private def activity_foreign
    activity_target.try(:owner)
  end

  private def activity_groups
    [activity_target]
  end

  private def activity_visibility
    activity_target.try(:public) ? 'public' : 'private'
  end

  private def activity_extra_data
    {
      # We store full slot data to the activity stream.
      # The backend needs no further request on the database.
      target: Feed.render_shared_object(activity_target),
      actor: Feed.render_shared_object(activity_actor),
      foreign: Feed.render_shared_object(activity_foreign)
    }
  end
end
