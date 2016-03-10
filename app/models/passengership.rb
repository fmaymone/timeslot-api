class Passengership < ActiveRecord::Base
  # table for many-to-many relations between users and slots
  # this table contains the slots for the MyCalendar of the users

  include SlotActivity

  after_commit AuditLog

  scope :active, -> { where deleted_at: nil }
  scope :add_media_permitted,
        -> { where(deleted_at: nil, add_media_permission: true) }

  belongs_to :slot, class_name: BaseSlot, inverse_of: :passengerships
  belongs_to :user, inverse_of: :passengerships

  validates :slot, presence: true
  validates :user, presence: true

  # when a slot is removed from MyCalendar or
  # when a slot is deleted
  def delete
    remove_activity
    slot.remove_follower(user)
    slot.touch
    user.touch
    ts_soft_delete
  end

  ## Activity Methods ##

  private def activity_target
    slot #.reload # FIX: reload MTI
  end

  private def activity_actor
    slot.creator
  end

  private def activity_foreign
    user
  end

  private def activity_action
    'tagged'
  end

  private def activity_notify
    []
  end
end
