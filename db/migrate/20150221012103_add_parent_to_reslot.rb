class AddParentToReslot < ActiveRecord::Migration
  def change
    add_column :re_slots, :parent_id, :integer, null: false
  end
end
