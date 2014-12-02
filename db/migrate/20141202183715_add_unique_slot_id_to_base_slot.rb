class AddUniqueSlotIdToBaseSlot < ActiveRecord::Migration
  def change
    execute("ALTER TABLE base_slots DROP CONSTRAINT base_slots_pkey;")
    add_column :base_slots, :slot_id, :primary_key
  end
end
