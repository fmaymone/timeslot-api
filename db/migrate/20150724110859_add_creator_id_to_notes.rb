class AddCreatorIdToNotes < ActiveRecord::Migration
  def up
    add_column :notes, :creator_id, 'bigint', null: false, default: false
  end

  def down
    remove_column :notes, :creator_id
  end
end
