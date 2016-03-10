class Containership < ActiveRecord::Base
  # table for many-to-many relations of slots and groups
  # concerning the naming: a group 'contains' slots
  # while this name is kinda funny IMHO it's much better than SlotGroupship

  include GroupActivity

  after_commit AuditLog

  scope :active, -> { where deleted_at: nil }

  belongs_to :slot, class_name: BaseSlot, inverse_of: :containerships
  belongs_to :group, inverse_of: :containerships

  validates :slot, presence: true
  validates :group, presence: true

  # when a slot is removed from a slotgroup or
  # when a slot gets deleted or
  # when a slotgroup gets deleted
  def delete
    remove_activity('leave')
    slot.remove_follower(group)
    slot.touch
    group.touch
    ts_soft_delete
  end

  ## Activity Methods ##

  private def activity_target
    group
  end

  private def activity_actor
    slot.creator
  end

  private def activity_foreign
    group.owner
  end

  private def activity_notify
    []
  end

  private def activity_action
    'containership'
  end
end
