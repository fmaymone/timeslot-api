class AddLocalIdToNotes < ActiveRecord::Migration
  def up
    add_column :notes, :local_id, :string, limit: 512
  end

  def down
    remove_column :notes, :local_id
  end
end
