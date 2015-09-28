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
  def activity_actor() user.id.to_s end

  # An activity tag as a verb
  def activity_verb() 'comment' end

  # The object which was updated/created
  def activity_object() slot.id.to_s end

  # The object which includes the update as a target
  # We can use this to group/aggregate activities by slots
  def activity_target() slot.owner.id.to_s end

  # The foreign id is required to find activities for
  # changing we need the user here. If users changes their
  # visiblity, we have to delete activities from stream.
  def activity_foreign_id() slot.owner.id.to_s end

  # Add extra data to each activity. The data can be hide
  # from the output when the StreamRails::Enrich is not used.
  def activity_extra_data() {
      # The notification message for the activity
      message: I18n.t('notify_create_comment',
                      name: user.username,
                      title: slot.meta_slot.title),
      # We store full slot data to the activity stream.
      # The backend needs no further request on the database.
      slot: Activity.slot_as_json(slot, user),
      user: Activity.user_as_json(user)
  } end

  # Returns an array of user which should also be notified
  # The official documentation of stream_rails gem is incomplete.
  # A part how to implement aggregations are missing, that's why
  # we have to fall back to the plain ruby way which is also compatible.
  def activity_notify
    # Collect all related user which should be notified
    user_ids = [slot.owner.id]
    user_ids.concat(slot.comments.pluck(:user_id).uniq)
    user_ids.concat(slot.likes.pluck(:user_id))
    # Remove the user who did the actual comment
    user_ids.delete(user.id)
    user_ids = user_ids.uniq
    # Maps the aggregated feed instance for each user
    user_ids.map{|v| StreamRails.client.feed('aggregated', v.to_s)}.concat(
        # Maps also the notification feed instance for each user (optional)
        user_ids.map{|v| StreamRails.feed_manager.get_notification_feed(v.to_s)}
    )
  end

  # This code lets the current user's flat and aggregated feeds
  # follow the target_user's personal feed:
  # StreamRails.feed_manager.follow_user(user_id, target_id)
  # StreamRails.client.feed('aggregated', owner_id).follow('user', foreign_id)

  ## << Trigger End -- ##

end
