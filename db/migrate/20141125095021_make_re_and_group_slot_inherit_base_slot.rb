class MakeReAndGroupSlotInheritBaseSlot < ActiveRecord::Migration
  def up
    add_column :re_slots, :footest, :string
    add_column :re_slots, :deleted_at, :datetime
    add_column :group_slots, :footest, :string
    add_column :group_slots, :deleted_at, :datetime
    execute("ALTER TABLE re_slots INHERIT base_slots;")
    execute("ALTER TABLE group_slots INHERIT base_slots;")
  end

  def down
    execute("ALTER TABLE re_slots NO INHERIT base_slots;")
    execute("ALTER TABLE group_slots NO INHERIT base_slots;")
    remove_column :re_slots, :footest
    remove_column :re_slots, :deleted_at
    remove_column :group_slots, :footest
    remove_column :group_slots, :deleted_at
  end
end
