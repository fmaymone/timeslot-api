module Activity

  def create_activity(action = nil)
    if activity_is_valid?
      create_activity_feed(action)
      create_activity_push(action) if push_is_valid?
    end
  rescue => error
    error_handler(error, "failed: create '#{action}' activity as worker job")
  ensure
    return self
  end

  def forward_activity(action = nil, feed_fwd: [], push_fwd: [])
    if activity_is_valid?
      create_activity_feed(action, notify: nil, forward: feed_fwd)
      create_activity_push(action, notify: nil, forward: push_fwd) if push_is_valid?
    end
  rescue => error
    error_handler(error, "failed: forward '#{action}' activity as worker job")
  ensure
    return self
  end

  def update_activity(action = nil)
    if activity_is_valid?
      update_activity_feed(action)
      update_activity_push(action) if push_is_valid?
    end
  rescue => error
    error_handler(error, "failed: update '#{action}' activity as worker job")
  ensure
    return self
  end

  def update_activity_objects
    if activity_is_valid?
      create_activity_feed('update', notify: [], forward: [])
    end
  rescue => error
    error_handler(error, "failed: update shared object as worker job")
  ensure
    return self
  end

  def remove_activity(action = 'delete')
    if activity_is_valid?
      remove_activity_feed(action)
      remove_activity_push(action) if push_is_valid?
    end
  rescue => error
    error_handler(error, "failed: remove '#{action}' activity as worker job")
  ensure
    return self
  end

  def remove_all_activities(action = 'delete', target: nil, user: nil)
    if activity_is_valid?
      remove_activity_feed(action, target: target, user: user)
      remove_activity_push(action, target: target, user: user) if push_is_valid?
    end
  rescue => error
    error_handler(error, "failed: remove all activities as worker job")
  ensure
    return self
  end

  def forward_deletion(action = 'delete')
    create_activity_feed(action, notify: nil, forward: {
        User: [activity_actor.id.to_s],
        Notification: activity_target.followers
    })
    create_activity_push(action, notify: nil, forward: activity_target.followers) if push_is_valid?
  rescue => error
    error_handler(error, "failed: forward 'deletion' activity as worker job")
  ensure
    return self
  end

  ## Private Helpers ##

  private def create_activity_feed(action, notify: nil, forward: nil, time: nil)
    # FIX: Reload last modified data (strict mode throws exceptions)
    activity_target.save! if activity_target.changed?
    activity_actor.save! if activity_actor.changed?
    # Initialize job worker
    FeedJob.perform_async({
      type: activity_type,
      actor: activity_actor.id.to_s,
      object: self.id.to_s,
      model: self.class.name,
      target: activity_target.id.to_s,
      action: action || activity_action,
      message: activity_message_params,
      foreign: activity_foreign.try(:id).try(:to_s),
      notify: notify || activity_notify,
      forward: forward || activity_forward,
      data: activity_extra_data,
      time: time || self.updated_at
    })
  rescue => error
    error_handler(error, "failed: initialize activity as worker job")
  end

  private def create_activity_push(action, notify: nil, forward: nil)
    notify = forward || notify || activity_push
    action = action || activity_action

    # Remove creator from the push notification list
    notify.delete(activity_actor.id)

    if notify.any?
      message_params = {
        KEY: "#{activity_type.downcase}_#{action}_push_singular",
        USER: activity_actor.username,
        USER2: activity_target.try(:username),
        TITLE: activity_target.try(:title)
      }
      params = { message: message_params }
      if activity_type == 'Slot'
        params[:slot_id] = activity_target.id
      elsif activity_type == 'User'
        if action == 'request'
          params[:user_id] = activity_target.id
        elsif action == 'friendship'
          params[:friend_id] = activity_actor.id
        end
      end
      Device.notify_all(notify, params)
    end
  end

  private def update_activity_feed(action)
    # Actually we made updates simple in handy with a tiny performance impact
    remove_activity(action)
    create_activity(action)
    # NOTE: this could be improved by a real update implementation (when it is required):
    # TODO: [TML-77]
  end

  private def update_activity_push(action)
    # TODO: [TML-77]
    # TODO: [TML-71]
  end

  private def remove_activity_feed(action, target: nil, user: nil)
    # Add actor and foreign user to the activity removal dispatcher
    notify = activity_notify || []
    notify << activity_actor.id.to_s
    notify << activity_foreign.id.to_s if activity_foreign
    notify.uniq

    target = target.as_json if target
    user_targets = user ? Feed.remove_user_from_feeds(user: user, notify: notify) : nil

    # Remove activities from target feeds:
    RemoveJob.perform_async({
        object: self.id.to_s,
        model: self.class.name,
        target: activity_target.id.to_s,
        type: activity_type,
        notify: notify
      },
      target: target,
      user_targets: user_targets
    )

    # NOTE: If a slot was deleted all activities to its corresponding objects will be deleted too,
    # BUT this should not trigger a new activity like an "unlike"
    if activity_action == 'slot' && action == 'private' && activity_is_valid? # || action == 'unslot'
      # Forward "deletion" action as an activity to the dispatcher
      forward_deletion(action)
    end
  rescue => error
    error_handler(error, "failed: remove activity as worker job")
  end

  private def remove_activity_push(action, target: nil, user: nil)
    # TODO: [TML-71]
    # create_activity_push(action) if push_is_valid?
  end

  # This method should be overridden in the subclass
  # if custom validation is required
  private def activity_is_valid?
    self.deleted_at.nil? &&
    activity_actor.present? &&
    activity_target.present? &&
    # FIX: only activities from "real users" are valid:
    activity_actor.role != 1 &&
    activity_actor.deleted_at.nil? &&
    activity_target.deleted_at.nil? &&
    # FIX: skip if an activity has no action:
    activity_action.present?
  end

  # This method should be overridden in the subclass
  # if custom validation is required
  private def push_is_valid?
    !Rails.application.config.SKIP_PUSH_NOTIFICATION
  end

  # Feed distribution through social relations
  # We differentiate 5 types of activities in dynamic social context:
  #
  # 1. Target related context
  # 2. Actor related context
  # 3. Friend related context (is handled same as User.followers actually)
  # 4. Group related context
  # 5. Foreign related context

  private def activity_notify

    # FIX: try to get parent visibility if predecessor has no visibility
    visibility = activity_target.try(:visibility) ||
                 activity_target.try(:parent).try(:visibility)

    # Additional check (only for security reason)
    return [] if visibility == 'private'

    # Returns the array of users which should be notified through the distribution process
    user_ids = []

    # ACTUALLY NOT ACTIVE: When the target belongs to a group we do not collect any followers from one of the other social context (e.g. friends)

    # 4. Containership related context:
    activity_target.containerships.each do |containership|
      user_ids += containership.group.followers
    end

    # 4. Passengership related context:
    activity_target.passengerships.each do |passengership|
      user_ids << passengership.user.id
    end

    # TODO: Delegate social context as an activity parameter --> so we can justify amount of activities on each users feed during aggregation
    # NOTE: Actually we simplify activities on own content and foreign related content
    # 1. Target related context (by default):
    user_ids += activity_target.followers
    # 5. Foreign related context (by default):
    user_ids += activity_foreign.followers if activity_foreign
    # 2. Actor related context:
    user_ids += activity_actor.followers if visibility == 'foaf' || visibility == 'public'

    # NOTE: Instead of distributing unrelated public slots we try to extend the social context
    # 3. Friend related context:
    # if visibility == 'public'
    #   %W(#{activity_target}
    #      #{activity_actor}
    #      #{activity_foreign}).each do |context|
    #       # Go deeper in dimension of social context to get more relations (through friends of friends/foreigns)
    #       # NOTE: we can loop through followers here, but this has an additional fetching users from DB
    #       # This can also be solved by adding friends of friends as a relation directly into the follower model
    #       unless context.try(:friends).nil?
    #         context.friends.each do |friend|
    #           # Here we can fetch followers, change this into friends if further chaining is required
    #           user_ids += friend.followers #friend.friends.collect(&:id)
    #         end
    #       end
    #   end
    # end

    # Temporary fallback to simulate a "public-to-all-activity" feed
    # user_ids = User.all.collect(&:id).map(&:to_s).as_json if Rails.env.test?

    # Remove the user who did the actual activity
    user_ids.delete(activity_actor.id.to_s)
    # Remove the foreign user
    user_ids.delete(activity_foreign.id.to_s) if activity_foreign
    user_ids
  end

  # Returns an array of user which should be notified via push notification (AWS SNS)
  private def activity_push
    []
  end

  # Returns an array of user which should be notified via internal app notification (feed)
  private def activity_forward
    []
  end

  # The foreign id is required to find activities for
  # changing we need the user here. If users changes their
  # visiblity, we have to delete activities from stream.
  private def activity_foreign
    nil
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

  private def error_handler(error, activity, params = nil)
    Rails.logger.error { error }
    Airbrake.notify(error, activity: activity, params: params)
  end
end
