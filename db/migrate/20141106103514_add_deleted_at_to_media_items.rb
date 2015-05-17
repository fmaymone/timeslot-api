class AddDeletedAtToMediaItems < ActiveRecord::Migration
  def change
    add_column :media_items, :deleted_at, :datetime
  end
end
