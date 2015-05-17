class MakeStdSlotInheritBaseSlot < ActiveRecord::Migration
  def up
    add_column :std_slots, :footest, :string
    execute <<-SQL
      ALTER TABLE std_slots INHERIT base_slots;
    SQL
  end

  def down
    execute("ALTER TABLE std_slots NO INHERIT base_slots;")
    remove_column :std_slots, :footest
  end
end
