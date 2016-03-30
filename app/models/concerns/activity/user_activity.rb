module UserActivity
  include Activity

  private def activity_type
    'User'
  end

  private def activity_foreign
    activity_target
  end

  private def activity_push
    [activity_target.id]
  end

  # Add extra data to each activity. The data can be hide
  # from the output when the StreamRails::Enrich is not used.
  private def activity_extra_data
    {
      # We store full slot data to the activity stream.
      # The backend needs no further request on the database.
      target: JSON.parse(ApplicationController.new.render_to_string(
          template: 'v1/users/_user',
          layout: false,
          locals: {
              :user => activity_target
          }
      )),
      actor: JSON.parse(ApplicationController.new.render_to_string(
          template: 'v1/users/_user',
          layout: false,
          locals: {
              :user => activity_actor
          }
      ))
    }
  end

  # The message is used as a notification message
  # for the users activity feed
  private def activity_message_params
    {
      USER: activity_target.username,
      USER2: activity_actor.username
    }
  end
end
