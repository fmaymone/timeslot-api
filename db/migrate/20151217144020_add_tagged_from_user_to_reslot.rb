class AddTaggedFromUserToReslot < ActiveRecord::Migration
  def up
    add_column :re_slots, :tagged_from, :bigint, null: true
  end

  def down
    remove_column :re_slots, :tagged_from
  end
end
