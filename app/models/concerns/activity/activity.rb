module Activity

  def create_activity(action = nil)
    if activity_is_valid?
      create_activity_feed(action)
      create_activity_push(action) if push_is_valid?
    end
    self
  end

  def update_activity
    # TODO: [TML-77]
  end

  def remove_activity(action = 'delete')
    remove_activity_feed(action)
    remove_activity_push(action)
  end

  private def create_activity_feed(action, forward = nil, activity_time = nil)
    # FIX: Reload last modified data
    activity_target.save
    activity_actor.save
    begin
      FeedJob.new.async.perform({
        type: activity_type,
        actor: activity_actor.id.to_s,
        object: self.id.to_s,
        model: self.class.name,
        target: activity_target.id.to_s,
        action: action || activity_action,
        message: activity_message_params,
        foreign: activity_foreign.try(:id).to_s,
        notify: forward ? [] : activity_notify,
        forward: forward,
        data: activity_extra_data,
        time: activity_time || self.updated_at,
        feed: activity_target.class.name
      })
    rescue => error
      opts = {}
      opts[:parameters] = {
          activity: "failed: initialize activity as worker job"
      }
      Rails.logger.error { error }
      Airbrake.notify(error, opts)
    end
  end

  private def create_activity_push(action)
    # Remove creator from the push notification list
    push_notify.delete(activity_actor.id)

    unless push_notify.nil?
      # TODO: Move the message composing part into feed helper method --> Feed::enrich_feed
      message_content = I18n.t("#{activity_type.downcase}_#{action || activity_action}_push_singular",
                               USER: activity_actor.username,
                               TITLE: activity_target.try(:title))
      # Skip sending if no message exist
      if message_content
        Device.notify_all(push_notify, [ message: message_content,
                                         slot_id: activity_target.id ])
      end
    end
  end

  private def remove_activity_feed(action)
    begin
      # Add actor and foreign user to the activity removal dispatcher
      notify = activity_notify || []
      notify << activity_actor.id.to_s
      notify << activity_foreign.id.to_s if activity_foreign.present?
      # Remove activities from target feeds:
      RemoveJob.new.async.perform({
          object: self.id.to_s,
          model: self.class.name,
          target: activity_target.id.to_s,
          feed: activity_target.class.name,
          notify: notify.uniq
      })
      # Forward "delete" action as an activity to the dispatcher
      create_activity_feed(action, notify) #Time.zone.now
    rescue => error
      opts = {}
      opts[:parameters] = {
          activity: "failed: remove activity as worker job"
      }
      Rails.logger.error { error }
      Airbrake.notify(error, opts)
    end
  end

  private def remove_activity_push(action)
    # TODO: [TML-71]
    create_activity_push(action) if push_is_valid?
  end

  # This method should be overridden in the subclass
  # if custom validation is required
  private def activity_is_valid?
    self.deleted_at.nil? &&
    activity_actor &&
    activity_target &&
    activity_actor.role != 1 &&
    activity_actor.deleted_at.nil? &&
    activity_target.deleted_at.nil?
  end

  # This method should be overridden in the subclass
  # if custom validation is required
  private def push_is_valid?
    !Rails.application.config.SKIP_PUSH_NOTIFICATION
  end

  # Returns an array of user which should also be notified
  private def activity_notify
    # TODO: currently we are sending activities to all users
    # In "real" situation the feed dispatcher collect the related feed
    # through social relations (called: followings), these are also mapped in redis
    # To test the intended logic, we use this temporary switch here
    # This is only for current simulation of a "public activity feed"
    # When the iOS has implemented friends and groups, we can remove this switch
    if true #unless Rails.env.production?
      # Feed distribution through social relations:
      user_ids = activity_target.followers
      # When target belongs to a group we do not notify user followers (e.g. friends)
      if activity_group
        user_ids += activity_group.followers
      elsif activity_actor
        user_ids += activity_actor.followers
      end
      user_ids
    else
      # Temporary fallback to simulate a "public activity" feed
      # The limit for the to field is 100
      return [] if activity_actor.email.eql?('info@timeslot.com')
      user_ids = User.all.collect(&:id).map(&:to_s).as_json
    end
    # Remove the user who did the actual activity
    user_ids.delete(activity_actor.id.to_s)
    # Remove if foreign is similar to the actor
    user_ids.delete(activity_foreign.id.to_s) if activity_foreign.present? #&& (activity_foreign.id == activity_actor.id)
    user_ids
  end

  # Returns an array of user which should be via push notification (AWS SNS)
  private def push_notify
    []
  end

  # Indicates that the activity target belongs to a group
  private def activity_group
    activity_target.try(:group)
  end

  # The foreign id is required to find activities for
  # changing we need the user here. If users changes their
  # visiblity, we have to delete activities from stream.
  private def activity_foreign
    ''
  end

  # An activity tag as a action related to removing or deleting an activity
  private def activity_deletion
    'delete'
  end

  # Indicates on which activity main category the action was performed (e.g. 'Slot')
  private def activity_type
      raise NotImplementedError,
            "Subclasses must define the method 'activity_type'."
  end

  # The user who made the update
  private def activity_actor
    raise NotImplementedError,
          "Subclasses must define the method 'activity_actor'."
  end

  # The object which includes the update as a target
  # We can use this to group/aggregate activities by slots
  private def activity_target
    raise NotImplementedError,
          "Subclasses must define the method 'activity_target'."
  end

  # An activity tag as a action
  private def activity_action
    raise NotImplementedError,
          "Subclasses must define the method 'activity_action'."
  end

  # The message is used as a notification message
  private def activity_message_params
    raise NotImplementedError,
          "Subclasses must define the method 'activity_message_params'."
  end
end
