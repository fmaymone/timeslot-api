class RemoveFootestFromSlotRepresentations < ActiveRecord::Migration
  def up
    remove_column :std_slots, :footest
    remove_column :re_slots, :footest
    remove_column :group_slots, :footest
  end

  def down
    add_column :std_slots, :footest, :string
    add_column :re_slots, :footest, :string
    add_column :group_slots, :footest, :string
  end
end
