class IncreaseMediaLocalIdField < ActiveRecord::Migration
  def up
    change_column :media_items, :local_id, :string, limit: 512
  end

  def down
    change_column :media_items, :local_id, :string, limit: 64
  end
end
