class Like < ActiveRecord::Base
  include SlotActivity

  after_commit AuditLog

  belongs_to :user
  belongs_to :slot, class_name: BaseSlot, foreign_key: "base_slot_id",
             inverse_of: :likes, counter_cache: true

  validates_presence_of :user, :slot

  def delete
    BaseSlot.decrement_counter(:likes_count, base_slot_id)
    ts_soft_delete
  end

  ## Activity Methods ##

  private def activity_target
    slot
  end

  private def activity_actor
    user
  end

  private def activity_verb
    'like'
  end
end
