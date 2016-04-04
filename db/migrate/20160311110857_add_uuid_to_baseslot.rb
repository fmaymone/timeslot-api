class AddUuidToBaseslot < ActiveRecord::Migration
  def change
    add_column :base_slots, :slot_uuid, :uuid, null: false, default: 'uuid_generate_v4()'
    set_muid_as_slot_uuid_for_global_slots
    change_column_null :global_slots, :muid, true
  end

  private def set_muid_as_slot_uuid_for_global_slots
    puts "setting muid as slot_uuid for #{GlobalSlot.count} existing global slots..."
    GlobalSlot.find_each do |slot|
      old_slot_uuid = slot.slot_uuid
      slot.update(slot_uuid: slot.muid)
      puts "changed #{old_slot_uuid} to #{slot.slot_uuid} for #{slot.title}"
    end
  end
end
