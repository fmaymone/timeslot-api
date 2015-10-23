class GroupActivity < Activity

  self.abstract_class = true

  private

  def activity_type
    'Group'
  end

  # The foreign id is required to find activities for
  # changing we need the user here. If users changes their
  # visiblity, we have to delete activities from stream.
  def activity_foreign
    activity_target.owner
  end

  # Add extra data to each activity. The data can be hide
  # from the output when the StreamRails::Enrich is not used.
  def activity_extra_data
    {
      # We store full slot data to the activity stream.
      # The backend needs no further request on the database.
      #target: JSONView.group(activity_group),
      actor: JSONView.user(activity_actor)
    }
  end

  # The message is used as a notification message
  # for the users activity feed
  def activity_message_params
    {
      USER: activity_actor.username,
      GROUP: activity_target.name
    }
  end
end
