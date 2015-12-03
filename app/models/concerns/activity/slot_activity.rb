module SlotActivity
  include Activity

  private def activity_type
    'Slot'
  end

  # The foreign user is required to find activities for
  # changing we need the user here. If users changes their
  # visiblity, we have to delete activities from stream.
  private def activity_foreign
    activity_target.creator
  end

  private def activity_is_valid?
    super && (activity_target.try(:visibility) != 'private')
  end

  private def push_is_valid?
    !Rails.application.config.SKIP_PUSH_NOTIFICATION
  end

  private def push_notify
    [activity_foreign.id]
  end

  # Add extra data to each activity. The data can be hide
  # from the output when the StreamRails::Enrich is not used.
  private def activity_extra_data
    {
      # We store full slot data to the activity stream.
      # The backend needs no further request on the database.
      target: JSONView.slot(activity_target),
      actor: JSONView.user(activity_actor)
    }
  end

  # The message is used as a notification message
  # for the users activity feed
  private def activity_message_params
    {
      USER: activity_actor.username,
      TITLE: activity_target.meta_slot.title
    }
  end
end
