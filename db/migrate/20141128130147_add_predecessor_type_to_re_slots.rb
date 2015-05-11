class AddPredecessorTypeToReSlots < ActiveRecord::Migration
  def up
    add_column :re_slots, :predecessor_type, :string, limit: 10, null: false
    # changed the following lines bc of a circular dependency error for migrations, the columns are already obsolete anyway
    add_column :std_slots, :sub_type, :string, limit: 10, default: '11' # StdSlot.model_name.param_key
    add_column :re_slots, :sub_type, :string, limit: 10, default: '12' # ReSlot.model_name.param_key
    add_column :group_slots, :sub_type, :string, limit: 10, default: '13' # GroupSlot.model_name.param_key
    add_column :base_slots, :sub_type, :string, limit: 10, null: false
    add_reference :base_slots, :meta_slot
    add_index :base_slots, [:id, :sub_type], unique: true
    change_column_null :re_slots, :predecessor_id, false
    change_column_null :re_slots, :slotter_id, false
    change_column_null :re_slots, :meta_slot_id, false
  end

  def down
    remove_column :base_slots, :sub_type
    remove_column :re_slots, :sub_type
    remove_column :std_slots, :sub_type
    remove_column :group_slots, :sub_type
    remove_column :re_slots, :predecessor_type
    remove_reference :base_slots, :meta_slot
    change_column_null :re_slots, :predecessor_id, true
    change_column_null :re_slots, :slotter_id, true
    change_column_null :re_slots, :meta_slot_id, true
  end
end
