module Activity

  def create_activity(action = activity_action)
    if activity_is_valid?
      create_activity_feed(action)
      create_activity_push(action) if push_is_valid?
    end
  rescue => error
    error_handler(error, "failed: create '#{action}' activity as worker job")
  ensure
    return self
  end

  # The 'forward_activity' method provides a full customizable activity distribution on place.
  # Example:
  #
  # self.forward_activity(
  #     'like',
  #     feed_fwd: {
  #         User: [activity_actor.id.to_s],
  #         News: [],
  #         Notification: [activity_target.id.to_s]
  #     },
  #     push_fwd: [activity_target.id]
  # )
  #
  # NOTES:
  # If you do not pass an action as first parameter the default activity_action is used instead.
  # A forwarded activity completely overrides/skip the default distribution context of this activity.
  # The self.class.name + the activity_action give the activity/message key. This key is used
  # by the message composer during aggregation/feed building to get the right translation.

  def forward_activity(action = activity_action, feed_fwd: [], push_fwd: [])
    if activity_is_valid?
      create_activity_feed(action, notify: nil, forward: feed_fwd)
      create_activity_push(action, notify: nil, forward: push_fwd) if push_is_valid?
    end
  rescue => error
    error_handler(error, "failed: forward '#{action}' activity as worker job")
  ensure
    return self
  end

  def update_activity(action = activity_action)
    if activity_is_valid?
      update_activity_feed(action)
      update_activity_push(action) if push_is_valid?
    end
  rescue => error
    error_handler(error, "failed: update '#{action}' activity as worker job")
  ensure
    return self
  end

  # TODO: Rethink about this async strategy: distribute a dummy activity
  # def update_activity_objects
  #   if activity_is_valid?
  #     create_activity_feed('update', notify: [], forward: [])
  #   end
  # rescue => error
  #   error_handler(error, "failed: update shared object as worker job")
  # ensure
  #   return self
  # end

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

  private def create_activity_feed(action = activity_action, notify: nil, forward: nil, time: nil)
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
      message: activity_message_params,
      foreign: activity_foreign.try(:id).try(:to_s),
      notify: notify || activity_notify,
      forward: forward || activity_forward(action),
      data: activity_extra_data,
      time: time || self.updated_at
    })

    # Update actors feed + shared objects
    activity_update_feed
  rescue => error
    error_handler(error, "failed: initialize activity as worker job")
  end

  private def create_activity_push(action = activity_action, notify: nil, forward: nil)
    notify = forward || notify || activity_push(action)

    # Remove creator from the push notification list
    notify.delete(activity_actor.id)

    if notify.any?
      message_params = {
        KEY: "#{activity_type.downcase}_#{action}_push_singular",
        ACTOR: activity_actor.username,
        USER: activity_target.try(:username),
        TITLE: activity_target.try(:title),
        NAME: activity_target.try(:name)
      }
      params = { message: message_params }
      if activity_type == 'Slot'
        params[:slot_id] = activity_target.id
      elsif activity_type == 'User'
        params[:user_id] = activity_target.id
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
    forwards = activity_forward(action)
    # Add actor + foreign + forwarded users to the activity removal dispatcher
    notify = activity_notify || []
    notify += forwards[:User] if forwards[:User]
    notify += forwards[:News] if forwards[:News]
    notify += forwards[:Notification] if forwards[:Notification]
    notify << activity_actor.id.to_s
    notify << activity_foreign.id.to_s if activity_foreign

    notify.uniq!

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
    # TODO: put this deletion activity to the new distribution mapper
    if activity_action == 'slot' && action == 'private' && activity_is_valid? # || action == 'unslot'
      # Forward "deletion" action as an activity to the dispatcher
      forward_deletion(action)
    end

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
    #return [] if visibility == 'private'

    # Returns the array of users which should be notified through the distribution process
    user_ids = []

    # 1. Target related context (by default):
    user_ids += activity_target.followers
    # 2. Actor related context:
    user_ids += activity_actor.followers if visibility == 'foaf' || visibility == 'public'
    # 4. Containership related context:
    activity_groups.each do |group|
      user_ids += group.followers
    end
    # 5. Foreign related context (actually not active):
    #user_ids += activity_foreign.followers if activity_foreign

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

    # Add the actor to the news feed distribution
    user_ids << activity_actor.id.to_s

    user_ids.uniq!

    # NOTE: Actually we show activities to own contents in the creators news feed
    # Remove the user who did the actual activity (actor)
    user_ids.delete(activity_actor.id.to_s)
    # Remove the foreign user
    #user_ids.delete(activity_foreign.id.to_s) if activity_foreign

    user_ids
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

  private def get_recipients(context, remove_actor: false)
    # Determine social context from distribution map
    context = distribution_map[context.to_sym] || {}
    # FIX: Do not remove creator if the creator was manually set in the context
    remove_actor = false unless context.include?('creator')
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

    if context.include?('joiners')    # = friends + creator (if: public group?)
      groups = activity_type == 'Group' ? [activity_target] : activity_groups
      groups.each do |group|
        if group.public
          recipients += activity_actor.followers
          # NOTE: do not use 'activity_foreign' to get the creator
          recipients << activity_target.creator.id.to_s if activity_type == 'Slot'
        end
      end
    end

    recipients.uniq!
    # Remove the user from the news feed who did the actual activity (actor)
    recipients.delete(activity_actor.id.to_s) if remove_actor
    recipients
  end

  private def activity_update_feed
    # TODO: simplify this
    # Update feed caches + shared objects
    Feed.update_shared_objects([activity_actor, activity_target])
    Feed.refresh_feed_cache(activity_actor)
  end

  # TODO:
  # The groups which are related to the activity target object
  private def activity_groups
    []
  end

  # The visibility which are related to the activity target object
  private def activity_visibility
    activity_target.try(:visibility) ||
    (activity_target.try(:public) ? 'public' : 'private')
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
  def activity_action
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

  # The distribution map exported from the google spreadsheet
  # NOTE: to beautify the code use: http://www.cleancss.com/ruby-beautify/
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

        slot_slot_me: %w(actor),
        slot_slot_activity: %w(friends follower creator member),
        slot_slot_notify: [],
        slot_slot_push: [],

        slot_image_me: %w(actor),
        slot_image_activity: %w(friends follower creator member),
        slot_image_notify: %w(follower),
        slot_image_push: %w(follower),

        slot_video_me: %w(actor),
        slot_video_activity: %w(friends follower creator member),
        slot_video_notify: %w(follower),
        slot_video_push: %w(follower),

        slot_audio_me: %w(actor),
        slot_audio_activity: %w(friends follower creator member),
        slot_audio_notify: %w(follower),
        slot_audio_push: %w(follower),

        slot_note_me: %w(actor),
        slot_note_activity: %w(friends follower creator member),
        slot_note_notify: %w(follower),
        slot_note_push: %w(follower),

        slot_media_me: %w(actor),
        slot_media_activity: %w(friends follower creator member),
        slot_media_notify: %w(follower),
        slot_media_push: %w(follower),

        slot_reslot_me: %w(actor),
        slot_reslot_activity: %w(friends follower creator member),
        slot_reslot_notify: %w(creator),
        slot_reslot_push: %w(creator),

        user_accept_me: [],
        user_accept_activity: [],
        user_accept_notify: %w(actor),
        user_accept_push: %w(user),

        user_friendship_me: %w(actor),
        user_friendship_activity: [],
        user_friendship_notify: %w(user),
        user_friendship_push: [],

        group_membership_me: %w(actor),
        group_membership_activity: %w(joiners member),
        group_membership_notify: %w(owner),
        group_membership_push: %w(owner),

        group_membertag_me: %w(actor),
        group_membertag_activity: %w(joiners member),
        group_membertag_notify: %w(foreign),
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

        slot_update_me: [],
        slot_update_activity: [],
        slot_update_notify: [],
        slot_update_push: [],

        user_unfriend_me: %w(actor),
        user_unfriend_activity: [],
        user_unfriend_notify: [],
        user_unfriend_push: [],

        user_reject_me: %w(actor),
        user_reject_activity: [],
        user_reject_notify: [],
        user_reject_push: [],

        slot_tagged_me: %w(actor),
        slot_tagged_activity: %w(friends followers member),
        slot_tagged_notify: %w(foreign),
        slot_tagged_push: %w(foreign),

        group_request_me: %w(actor),
        group_request_activity: [],
        group_request_notify: [],
        group_request_push: [],

        group_reject_me: %w(actor),
        group_reject_activity: [],
        group_reject_notify: [],
        group_reject_push: [],

        group_kick_me: %w(actor),
        group_kick_activity: [],
        group_kick_notify: [],
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
        group_ungroup_notify: [],
        group_ungroup_push: [],

        group_create_me: %w(actor),
        group_create_activity: %w(joiners actor),
        group_create_notify: [],
        group_create_push: []
    }
  end
end
