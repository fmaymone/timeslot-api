module SlotActivity
  include Activity

  private def activity_type
    'Slot'
  end

  # The foreign user is required to find activities for
  # changing we need the user here. If users changes their
  # visiblity, we have to delete activities from stream.
  private def activity_foreign
    activity_target.try(:creator) ||
    activity_target.try(:owner)
  end

  # The groups which are related to the activity target object
  private def activity_groups
    activity_target.containerships.collect(&:group)
  end

  # This method should be overridden in the subclass
  # if custom validation is required
  # private def activity_is_valid?
  #   visibility = activity_target.try(:visibility)
  #   super && (visibility.nil? || (visibility != 'private'))
  # end

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
  private def activity_message_params(action = nil)
    {
      ACTOR: activity_actor.username,
      TITLE: activity_target.meta_slot.title,
      FIELD: action || activity_action
    }
  end
end
