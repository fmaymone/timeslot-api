module Activity

  def create_activity(action = activity_action, feed_fwd: nil, push_fwd: nil)
    if activity_is_valid?(action)
      create_activity_feed(action, forward: feed_fwd)
      create_activity_push(action, forward: push_fwd) if push_is_valid?
    end
  rescue => error
    error_handler(error, "failed: create '#{action}' activity")
  ensure
    return self
  end

  def update_activity(action = activity_action)
    if activity_is_valid?(action)
      update_activity_feed(action)
      update_activity_push(action) if push_is_valid?
    end
  rescue => error
    error_handler(error, "failed: update '#{action}' activity")
  ensure
    return self
  end

  def remove_activity(action = 'delete')
    if activity_is_valid?(action)
      remove_activity_feed(action)
      remove_activity_push(action) if push_is_valid?
    end
  rescue => error
    error_handler(error, "failed: remove '#{action}' activity")
  ensure
    return self
  end

  def remove_all_activities(action = 'delete', target: nil, user: nil)
    if activity_is_valid?(action)
      remove_activity_feed(action, target: target, user: user)
      remove_activity_push(action, target: target, user: user) if push_is_valid?
    end
  rescue => error
    error_handler(error, "failed: remove all activities")
  ensure
    return self
  end

  ## Private Helpers ##

  private def create_activity_feed(action = activity_action, forward: nil, time: nil)
    # FIX: Solid save last modified data (strict mode throws exceptions)
    activity_target.save! if activity_target.changed?
    activity_actor.save! if activity_actor.changed?

    # Initialize job worker
    FeedJob.perform_async({
      type: activity_type,
      actor: activity_actor.id.to_s,
      object: self.id.to_s,
      model: self.class.name,
      target: activity_target.id.to_s,
      action: action,
      foreign: activity_foreign.try(:id).try(:to_s),
      forward: forward || activity_forward(action),
      data: activity_extra_data,
      time: time || self.updated_at
    })

    # Update actors feed + shared objects
    activity_update_feed
  rescue => error
    error_handler(error, "failed: initialize activity as worker job")
  end

  private def create_activity_push(action = activity_action, forward: nil)
    recipients = forward || activity_push(action)

    # Remove creator from the push notification list
    recipients.delete(activity_actor.id)

    if recipients.any?
      message_params = {
        KEY: "#{activity_type.downcase}_#{action}_push_singular",
        ACTOR: activity_actor.username,
        USER: activity_target.try(:username),
        TITLE: activity_target.try(:title),
        NAME: activity_target.try(:name)
      }
      params = { message: message_params }

      case activity_type
      when 'Slot'
        params[:slot_id] = activity_target.id
      when 'Group'
        params[:group_id] = activity_target.id
      when 'User'
        params[:user_id] = activity_actor.id
      end

      Device.notify_all(recipients, params)
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
    forwards = activity_forward(action)
    # Add actor + foreign + forwarded users to the activity removal dispatcher
    recipients = []
    recipients += forwards[:User] if forwards[:User]
    recipients += forwards[:News] if forwards[:News]
    recipients += forwards[:Notification] if forwards[:Notification]
    recipients << activity_actor.id.to_s
    recipients << activity_foreign.id.to_s if activity_foreign

    recipients.uniq!

    target = target.as_json if target
    user_targets = user ? Feed.remove_user_from_feeds(user: user, recipients: recipients) : nil

    # Remove activities from target feeds:
    RemoveJob.perform_async({
        object: self.id.to_s,
        model: self.class.name,
        target: activity_target.id.to_s,
        type: activity_type,
        recipients: recipients
      },
      target: target,
      user_targets: user_targets
    )

    # Update actors feed + shared objects
    activity_update_feed
  rescue => error
    error_handler(error, "failed: remove activity as worker job")
  end

  private def remove_activity_push(action, target: nil, user: nil)
    # TODO: [TML-71]
    # create_activity_push(action) if push_is_valid?
  end

  # This method should be overridden in the subclass
  # if custom validation is required
  private def activity_is_valid?(action = activity_action)
    !Rails.application.config.SKIP_ACTIVITY &&
    activity_actor.present? &&
    activity_target.present? &&
    action.present? &&
    # FIX: allow removal-related activities
    (action.in?(%w(delete private unslot unshare unfriend ungroup reject kick leave)) || (
        self.deleted_at.nil? &&
        activity_actor.deleted_at.nil? &&
        activity_target.deleted_at.nil?)
    ) &&
    # FIX: only activities from "real users" are valid:
    activity_actor.role != 1
  end

  # This method should be overridden in the subclass
  # if custom validation is required
  private def push_is_valid?
    !Rails.application.config.SKIP_PUSH_NOTIFICATION
  end

  # Returns an array of user which should be notified via push notification (AWS SNS)
  private def activity_push(action = activity_action)
    # Remove the user from the news feed who did the actual activity (actor)
    get_recipients("#{activity_type.downcase}_#{action}_push", remove_actor: true).map(&:to_i)
  end

  # Returns an array of user which should be notified via internal app notification (feed)
  private def activity_forward(action = activity_action)
    {
      User:
        get_recipients("#{activity_type.downcase}_#{action}_me"),
      News:
        get_recipients("#{activity_type.downcase}_#{action}_activity", remove_actor: true),
      Notification:
        get_recipients("#{activity_type.downcase}_#{action}_notify", remove_actor: true)
    }
  end

  # Feed distribution through social relations
  # The social context is differentiated by 6 types of associations:
  #
  # 1. Target related context
  # 2. Actor related context
  # 3. Friend related context
  # 4. Group related context
  # 5. Foreign related context
  # 6. Public related context (is actually not supported)

  private def get_recipients(context, remove_actor: false)
    # Determine social context from distribution map
    context = distribution_map[context.to_sym] || {}
    # FIX: Do not remove creator if the creator was manually set in the context
    remove_actor = false if context.include?('actor')
    # Collect recipients through social context
    recipients = []

    ## -- Distribution Keys: Related to Actor -- ##

    if context.include?('actor')      #  = the user who makes the action (initiator)
      recipients << activity_actor.id.to_s
    end
    if context.include?('friends')    # = all friends of the actor (users follower)
      # FIX: here we cut the viral distribution through friend associations on non-public Slots/Groups
      recipients += activity_actor.followers if activity_visibility == 'public'
    end
    if context.include?('myfoaf')     # = all friends of actors friend (actually unused)
      activity_actor.friendships.each do |friendship|
        recipients += (friendship.user == activity_actor ? friendship.friend : friendship.user).followers
      end
    end

    ## -- Distribution Keys: Related to Slot-Target -- ##

    if context.include?('follower')   # = slot followers (incl. group members)
      recipients += activity_target.followers
    end
    if context.include?('creator')    # = the creator of the slot
      recipients << activity_target.creator.id.to_s
    end
    if context.include?('commenter')  # = the users who commented on the slot
      users = activity_target.comments.pluck(:user_id) || []
      recipients += users.map(&:to_s) if users.any?
    end
    if context.include?('liker')      # = the users who likes the slot
      users = activity_target.likes.pluck(:user_id) || []
      recipients += users.map(&:to_s) if users.any?
    end
    if context.include?('poster')     # = the users who adds content to the slot
      # actually not supported
    end

    ## -- Distribution Keys: Related to Group-Target -- ##

    if context.include?('member')     # = members of a group (or slotgroups)
      if activity_type == 'Group'
        recipients += activity_target.followers
      elsif activity_type == 'Slot'
        activity_groups.each do |group|
          recipients += group.followers
        end
      end
    end
    if context.include?('owner')      # = the owner of the group
      recipients << activity_target.owner.id.to_s
    end
    if context.include?('admin')      # = the admin of the group
      recipients << activity_target.owner.id.to_s
    end

    ## -- Distribution Keys: Related to User-Target -- ##

    if context.include?('user')       # = the target user (not the actor!)
      recipients << activity_target.id.to_s
    end
    if context.include?('foaf')       # = all friends of a target user
      recipients += activity_target.followers
    end
    if context.include?('requester')  # = smb. who requests smth.
      recipients << activity_target.id.to_s
    end
    if context.include?('requestee')  # = smb. who has to accept smth.
      recipients << activity_actor.id.to_s
    end

    ## -- Distribution Keys: Indirect Associations -- ##

    if context.include?('foreign')    # = the user who is involved indirectly
      recipients << activity_foreign.id.to_s if activity_foreign
    end

    ## -- Distribution Keys: Mixed Context -- ##

    if context.include?('joiners')    # = friends (if: public group?)
      groups = activity_type == 'Group' ? [activity_target] : activity_groups
      groups.each do |group|
        recipients += activity_actor.followers if group.public
      end
    end

    recipients.uniq!
    # Remove the user from the news feed who did the actual activity (actor)
    recipients.delete(activity_actor.id.to_s) if remove_actor
    recipients
  end

  private def activity_update_feed
    # NOTE: It is possible that an action does'nt affect the actors feed,
    # for this situation it is required to force the update of shared objects
    Feed.update_objects([activity_actor, activity_target])
  end

  # TODO:
  # The groups which are related to the activity target object
  private def activity_groups
    []
  end

  # The visibility which are related to the activity target object
  private def activity_visibility
    nil
  end

  # The default redirection to where the user should be redirected by opening the activity
  private def activity_redirect
    nil
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

  private def error_handler(error, activity, params = nil)
    Rails.logger.error { error }
    Airbrake.notify(error, activity: activity, params: params)
    puts error
  end

  # The distribution map exported from the google spreadsheet
  private def distribution_map
    {
        slot_comment_me: %w(actor),
        slot_comment_activity: %w(friends follower creator member),
        slot_comment_notify: %w(commenter creator),
        slot_comment_push: %w(commenter creator follower),

        slot_like_me: %w(actor),
        slot_like_activity: %w(friends follower creator member),
        slot_like_notify: %w(creator),
        slot_like_push: %w(creator),

        slot_create_me: %w(actor),
        slot_create_activity: %w(friends follower creator member actor),
        slot_create_notify: [],
        slot_create_push: [],

        slot_image_me: %w(actor),
        slot_image_activity: %w(friends follower creator member),
        slot_image_notify: %w(follower creator),
        slot_image_push: %w(follower creator),

        slot_video_me: %w(actor),
        slot_video_activity: %w(friends follower creator member),
        slot_video_notify: %w(follower creator),
        slot_video_push: %w(follower creator),

        slot_audio_me: %w(actor),
        slot_audio_activity: %w(friends follower creator member),
        slot_audio_notify: %w(follower creator),
        slot_audio_push: %w(follower creator),

        slot_note_me: %w(actor),
        slot_note_activity: %w(friends follower creator member),
        slot_note_notify: %w(follower creator),
        slot_note_push: %w(follower creator),

        slot_media_me: %w(actor),
        slot_media_activity: %w(friends follower creator member),
        slot_media_notify: %w(follower creator),
        slot_media_push: %w(follower creator),

        slot_reslot_me: %w(actor),
        slot_reslot_activity: %w(friends follower creator member),
        slot_reslot_notify: %w(creator),
        slot_reslot_push: %w(creator),

        user_accept_me: [],
        user_accept_activity: %w(foaf actor),
        user_accept_notify: %w(actor),
        user_accept_push: %w(user),

        user_friendship_me: %w(actor),
        user_friendship_activity: %w(friends),
        user_friendship_notify: %w(user),
        user_friendship_push: [],

        group_membership_me: %w(actor),
        group_membership_activity: %w(joiners member),
        group_membership_notify: %w(owner),
        group_membership_push: %w(owner),

        group_membertag_me: %w(actor),
        group_membertag_activity: %w(joiners member),
        group_membertag_notify: %w(foreign owner),
        group_membertag_push: %w(foreign),

        slot_delete_me: %w(actor),
        slot_delete_activity: [],
        slot_delete_notify: %w(follower),
        slot_delete_push: %w(follower),

        slot_unslot_me: %w(actor),
        slot_unslot_activity: [],
        slot_unslot_notify: [],
        slot_unslot_push: [],

        user_request_me: %w(actor),
        user_request_activity: [],
        user_request_notify: %w(user),
        user_request_push: %w(user),

        slot_private_me: %w(actor),
        slot_private_activity: [],
        slot_private_notify: %w(follower),
        slot_private_push: %w(follower),

        slot_start_me: %w(actor),
        slot_start_activity: [],
        slot_start_notify: %w(follower),
        slot_start_push: %w(follower),

        slot_location_me: %w(actor),
        slot_location_activity: [],
        slot_location_notify: %w(follower),
        slot_location_push: %w(follower),

        user_unfriend_me: %w(actor),
        user_unfriend_activity: [],
        user_unfriend_notify: %w(user),
        user_unfriend_push: [],

        user_reject_me: %w(actor),
        user_reject_activity: [],
        user_reject_notify: %w(user),
        user_reject_push: [],

        slot_tagged_me: %w(actor),
        slot_tagged_activity: %w(friends followers member creator),
        slot_tagged_notify: %w(foreign creator),
        slot_tagged_push: %w(foreign),

        group_request_me: %w(actor),
        group_request_activity: [],
        group_request_notify: %w(owner),
        group_request_push: %w(owner),

        group_reject_me: %w(actor),
        group_reject_activity: [],
        group_reject_notify: %w(user),
        group_reject_push: [],

        group_kick_me: %w(actor),
        group_kick_activity: [],
        group_kick_notify: %w(user),
        group_kick_push: [],

        group_leave_me: %w(actor),
        group_leave_activity: [],
        group_leave_notify: %w(owner),
        group_leave_push: [],

        group_containership_me: %w(actor),
        group_containership_activity: %w(joiners member),
        group_containership_notify: %w(member),
        group_containership_push: %w(member),

        group_containertag_me: %w(actor),
        group_containertag_activity: %w(joiners member),
        group_containertag_notify: %w(member),
        group_containertag_push: %w(member),

        group_ungroup_me: %w(actor),
        group_ungroup_activity: [],
        group_ungroup_notify: %w(member),
        group_ungroup_push: [],

        group_create_me: %w(actor),
        group_create_activity: %w(joiners),
        group_create_notify: [],
        group_create_push: []
    }
  end
end
