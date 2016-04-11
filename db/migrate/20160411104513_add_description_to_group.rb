class AddDescriptionToGroup < ActiveRecord::Migration
  def up
    add_column :groups, :description, :string, limit: 255
  end

  def down
    remove_column :groups, :title
  end
end
