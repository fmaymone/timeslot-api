class Comment < ActiveRecord::Base
  include SlotActivity

  after_commit AuditLog

  belongs_to :user
  belongs_to :slot, class_name: BaseSlot, inverse_of: :comments,
             counter_cache: true

  validates_presence_of :user, :slot, :content
  validates :content, length: { maximum: 5000 }

  def delete
    remove_activity
    BaseSlot.decrement_counter(:comments_count, slot_id)
    ts_soft_delete
  end

  ## Activity Methods ##

  private def activity_target
    slot
  end

  private def activity_actor
    user
  end

  private def activity_action
    'comment'
  end

  # TODO:
  # private def activity_forward
  #   foreign = activity_foreign.try(:id).try(:to_s)
  #   actor = activity_actor.id.to_s
  #   forwarding = {
  #       User: [actor],
  #       News: activity_notify,
  #       Notification:
  #           foreign.present? && (actor != foreign) ?
  #             [foreign]
  #           : []
  #   }
  #   forwarding[:Notification] = (forwarding[:Notification] + activity_push).uniq
  #   forwarding
  # end

  private def activity_push
    user_ids = super
    user_ids += activity_target.comments.pluck(:user_id)
    user_ids += activity_target.likes.pluck(:user_id)
    # Remove the user who did the actual activity
    user_ids.delete(activity_actor.id)
    user_ids.uniq
  end
end
