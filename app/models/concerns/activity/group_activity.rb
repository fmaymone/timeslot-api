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

  # Add extra data to each activity. The data can be hide
  # from the output when the StreamRails::Enrich is not used.
  private def activity_extra_data
    {
      # We store full slot data to the activity stream.
      # The backend needs no further request on the database.
      target: JSON.parse(ApplicationController.new.render_to_string(
          template: 'v1/groups/_group',
          layout: false,
          locals: {
              :group => activity_target,
              :current_user => activity_actor
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
      ACTOR: activity_actor.username,
      NAME: activity_target.name
    }
  end
end
