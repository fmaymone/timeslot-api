class AddTaggedBooleanFlagToReslot < ActiveRecord::Migration
  def up
    add_column :re_slots, :tagged, :boolean, null: false, default: false
  end

  def down
    remove_column :re_slots, :tagged
  end
end
