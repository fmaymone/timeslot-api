class ChangeUserTableColumns < ActiveRecord::Migration
  def change
    remove_column :users, :displayed
    add_column :users, :deleted_at, :datetime
  end
end
