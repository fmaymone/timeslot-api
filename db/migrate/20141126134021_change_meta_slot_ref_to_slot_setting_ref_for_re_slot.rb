class ChangeMetaSlotRefToSlotSettingRefForReSlot < ActiveRecord::Migration
  def up
    remove_reference :re_slots, :meta_slot, index: true
    add_reference :re_slots, :slot_setting, index: true
  end

  def down
    remove_reference :re_slots, :slot_setting, index: true
    add_reference :std_slots, :meta_slot, index: true
  end
end
