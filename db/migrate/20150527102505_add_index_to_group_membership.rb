class AddIndexToGroupMembership < ActiveRecord::Migration
  def up
    add_index :memberships, [:user_id, :group_id], unique: true
    remove_column :ios_locations, :geo_position
  end

  def down
    remove_index :memberships, column: [:user_id, :group_id]
    add_column :ios_locations, :geo_position, :point
  end
end
