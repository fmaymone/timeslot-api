class SlotActivity < Activity

  self.abstract_class = true

  private

  def activity_type
    'Slot'
  end

  def activity_is_valid?
    # TODO: this is temporarily set to simulate "public activity"
    # filter out private slots from it
    activity_target.visibility != 'private'
  end

  # The foreign id is required to find activities for
  # changing we need the user here. If users changes their
  # visiblity, we have to delete activities from stream.
  def activity_foreign
    activity_target.creator
  end

  # Add extra data to each activity. The data can be hide
  # from the output when the StreamRails::Enrich is not used.
  def activity_extra_data
    {
      # We store full slot data to the activity stream.
      # The backend needs no further request on the database.
      target: JSONView.slot(activity_slot),
      actor: JSONView.user(activity_user)
    }
  end

  # The message is used as a notification message
  # for the users activity feed
  def activity_message_params
    {
      USER: activity_actor.username,
      TITLE: activity_target.meta_slot.title
    }
  end
end
