class Comment < ActiveRecord::Base
  after_commit AuditLog

  belongs_to :slot, class_name: BaseSlot, inverse_of: :comments
  belongs_to :user

  validates_presence_of :user, :slot, :content
  validates :content, length: { maximum: 5000 }

  def delete
    update(deleted_at: Time.zone.now)
  end

  ## -- Trigger activities to Activity Stream >> ##

  include StreamRails::Activity
  as_activity

  # The user who made the update
  def activity_actor
    user.id.to_s
  end

  # An activity tag as a verb
  def activity_verb
    'comment'
  end

  # The object which was updated/created
  def activity_object
    self.id.to_s
  end

  # The object which includes the update as a target
  # We can use this to group/aggregate activities by slots
  def activity_target
    slot.id.to_s
  end

  # Returns an array of user which should also be notified
  def activity_notify
    # owner_id = slot.owner.id.to_s
    # user_id = user.id.to_s
    # if owner_id == user_id
    #   [] # TODO: notify to groups, friends or follower
    # else
    #   [StreamRails.feed_manager.get_notification_feed(owner_id)]
    # end

    # This code lets the current user's flat and aggregated feeds
    # follow the target_user's personal feed.
    # StreamRails.feed_manager.follow_user(user_id, target_id)

    # Collect all related user which should be notified
    user_ids = [slot.owner.id]
    user_ids.concat(slot.comments.pluck(:user_id).uniq)
    user_ids.concat(slot.likes.pluck(:user_id))
    # Remove the user who did the actual comment
    user_ids.delete(user.id)
    # Map the notification feed instance for each user
    user_ids.uniq.map!{|v| StreamRails.feed_manager.get_notification_feed(v.to_s)}
  end

  # The foreign id is required to find activities for
  # changing we need the user here. If users changes their
  # visiblity, we have to delete activities from stream.
  # def activity_foreign_id
  #   owner_id = slot.owner.id.to_s
  #   foreign_id = user.id.to_s
  #   # aggregated feed follows user, so the owner gets notification
  #   StreamRails.client.feed('aggregated', owner_id).follow('user', foreign_id)
  #   # the user who was made the notification should also get activity updates
  #   StreamRails.client.feed('aggregated', foreign_id).follow('user', owner_id)
  #   # to remove foreign activities from the users activity stream
  #   owner_id
  # end

  def activity_extra_data
    {
        message: I18n.t('notify_create_comment',
                        name: user.username,
                        title: slot.meta_slot.title),

        slot: Activity.slot_as_json(slot, user)
    }
  end

  ## << Trigger End -- ##

end
