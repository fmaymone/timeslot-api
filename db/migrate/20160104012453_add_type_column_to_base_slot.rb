class AddTypeColumnToBaseSlot < ActiveRecord::Migration
  def change
    add_column :base_slots, :type, :text
  end
end
