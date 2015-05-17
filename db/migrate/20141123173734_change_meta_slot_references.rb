class ChangeMetaSlotReferences < ActiveRecord::Migration
  def up
    add_reference :re_slots, :meta_slot, index: true
    add_reference :group_slots, :meta_slot, index: true
    add_reference :std_slots, :meta_slot, index: true
    remove_reference :std_slots, :user, index: true
    remove_reference :base_slots, :meta_slot, index: true
  end

  def down
    remove_reference :re_slots, :meta_slot, index: true
    remove_reference :group_slots, :meta_slot, index: true
    remove_reference :std_slots, :meta_slot, index: true
    add_reference :std_slots, :user, index: true
    add_reference :base_slots, :meta_slot, index: true
  end
end
