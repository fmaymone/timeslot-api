class Passengership < ActiveRecord::Base
  # table for many-to-many relations between users and slots
  # this table contains the slots for the MyCalendar of the users

  include SlotActivity

  after_commit AuditLog

  scope :active, -> { where deleted_at: nil }
  scope :add_media_permitted,
        -> { where(deleted_at: nil, add_media_permission: true) }
  scope :in_schedule,
        -> { where(deleted_at: nil, show_in_my_schedule: true) }

  belongs_to :slot, class_name: BaseSlot, inverse_of: :passengerships
  belongs_to :user, inverse_of: :passengerships

  validates :slot, presence: true
  validates :user, presence: true

  attr_accessor :initiator

  @initiator = nil

  # TODO: write spec
  def hide_from_my_schedule
    update(show_in_my_schedule: false)
    save
  end

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
    slot
  end

  private def activity_actor
    @initiator || user
  end

  private def activity_foreign
    @initiator ? user : nil
  end

  def activity_action
    @initiator ? 'tagged' : 'reslot'
  end
end
