class RemoveNoteAttrAndFootestFromSlots < ActiveRecord::Migration
  def up
    remove_column :base_slots, :footest
    remove_column :std_slots, :note
    remove_column :group_slots, :note
    remove_column :re_slots, :note
  end

  def down
    add_column :base_slots, :footest, :string
    add_column :std_slots, :note, :text, default: ""
    add_column :group_slots, :note, :text, default: ""
    add_column :re_slots, :note, :text, default: ""
  end
end
