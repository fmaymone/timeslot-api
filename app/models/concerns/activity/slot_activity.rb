module SlotActivity
  include Activity

  private def activity_type
    'Slot'
  end

  private def activity_foreign
    activity_target.try(:creator) ||
    activity_target.try(:owner)
  end

  private def activity_groups
    activity_target.containerships.active.collect(&:group)
  end

  private def activity_visibility
    activity_target.try(:visibility)
  end

  private def activity_is_valid?(action)
    super && (activity_visibility != 'private' || action == 'private')
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
