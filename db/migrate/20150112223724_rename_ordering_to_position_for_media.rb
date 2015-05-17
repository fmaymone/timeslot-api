class RenameOrderingToPositionForMedia < ActiveRecord::Migration
  def change
    rename_column :media_items, :ordering, :position
  end
end
