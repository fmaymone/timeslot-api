class AddUuidToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :uuid, :uuid, null: false
  end
end
