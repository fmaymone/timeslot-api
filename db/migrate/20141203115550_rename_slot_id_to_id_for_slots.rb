class RenameSlotIdToIdForSlots < ActiveRecord::Migration
  def up
    remove_column :base_slots, :id
    remove_column :std_slots, :id
    remove_column :group_slots, :id
    remove_column :re_slots, :id
    rename_column :base_slots, :slot_id, :id
    execute("ALTER SEQUENCE base_slots_slot_id_seq RENAME TO base_slots_id_seq")
  end

  def down
    rename_column :base_slots, :id, :slot_id
    add_column :std_slots, :id, :primary_key
    add_column :group_slots, :id, :primary_key
    add_column :re_slots, :id, :primary_key
    add_column :base_slots, :id, :integer, null: false
    execute("ALTER SEQUENCE base_slots_id_seq RENAME TO base_slots_slot_id_seq")
  end
end
