class RemoveLocationNameFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :location_name
  end

  def down
    add_column :users, :location_name, :string, limit: 128
  end
end
