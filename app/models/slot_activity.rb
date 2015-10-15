class SlotActivity < Activity

  self.abstract_class = true

  #after_touch do |slot|
    #puts "You have touched an object"
  #end

  # The user who made the update
  private def activity_actor
    user.id.to_s
  end

  # An activity tag as a verb
  private def activity_verb
    self.class.name.downcase
  end

  # The object which was updated/created
  private def activity_object
    slot.id.to_s
    #self.id
  end

  # The object which includes the update as a target
  # We can use this to group/aggregate activities by slots
  private def activity_target
    slot.creator.id.to_s
    #slot.id.to_s
  end

  # The foreign id is required to find activities for
  # changing we need the user here. If users changes their
  # visiblity, we have to delete activities from stream.
  private def activity_foreign_id
    slot.creator.id.to_s
  end

  # Add extra data to each activity. The data can be hide
  # from the output when the StreamRails::Enrich is not used.
  private def activity_extra_data
    {
      # The notification message for the activity
      message: activity_message,
      # We store full slot data to the activity stream.
      # The backend needs no further request on the database.
      slot: JSONView::slot(slot),
      user: JSONView::user(user)
    }
  end

  # Returns an array of user which should also be notified
  # The official documentation of stream_rails gem is incomplete.
  # A part how to implement aggregations are missing, that's why
  # we have to fall back to the plain ruby way which is also compatible.
  private def activity_notify
    # Collect all related user which should be notified
    # user_ids = [slot.owner.id]
    # user_ids.concat(slot.comments.pluck(:user_id).uniq)
    # user_ids.concat(slot.likes.pluck(:user_id))
    # To simplify we fall back to public notifications:

    # The limit for the to field is 100
    user_ids = User.all.collect(&:id)
    # Remove the user who did the actual comment
    user_ids.delete(user.id)
    #user_ids
    # Maps the aggregated feed instance for each user
    # user_ids.map{|v| StreamRails.client.feed('aggregated', v.to_s)}.concat(
    #     # Maps also the notification feed instance for each user (optional)
    #     user_ids.map{|v| StreamRails.feed_manager.get_notification_feed(v.to_s)}
    # )
  end

  # This code lets the current user's flat and aggregated feeds
  # follow the target_user's personal feed:
  # StreamRails.feed_manager.follow_user(user_id, target_id)
  # StreamRails.client.feed('aggregated', owner_id).follow('user', foreign_id)
end
