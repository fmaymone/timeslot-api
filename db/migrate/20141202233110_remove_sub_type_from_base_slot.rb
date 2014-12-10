class RemoveSubTypeFromBaseSlot < ActiveRecord::Migration
  def up
    remove_column :base_slots, :sub_type
    remove_column :re_slots, :sub_type
    remove_column :std_slots, :sub_type
    remove_column :group_slots, :sub_type
    remove_column :re_slots, :predecessor_type
  end

  def down
    add_column :re_slots, :predecessor_type, :string, limit: 10, null: false
    add_column :std_slots, :sub_type, :string, limit: 10, default: StdSlot.model_name.param_key
    add_column :re_slots, :sub_type, :string, limit: 10, default: ReSlot.model_name.param_key
    add_column :group_slots, :sub_type, :string, limit: 10, default: GroupSlot.model_name.param_key
    add_column :base_slots, :sub_type, :string, limit: 10, null: false
  end
end
