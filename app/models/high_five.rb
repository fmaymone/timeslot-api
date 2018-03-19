class HighFive < ActiveRecord::Base
  include SlotActivity
  
  after_commit AuditLog

  belongs_to :user
  belongs_to :slot, class_name: BaseSlot, foreign_key: "base_slot_id",
            inverse_of: :high_fives, counter_cache: true
            
   validates_presence_of :user, :slot
   
  def delete
    remove_activity
    BaseSlot.decrement_counter(:high_fives_count, base_slot_id)
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
    'high_five'
  end
   
end
