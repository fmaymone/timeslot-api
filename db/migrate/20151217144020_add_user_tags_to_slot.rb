class AddUserTagsToSlot < ActiveRecord::Migration
  def up
    add_column :base_slots, :user_tags, 'bigint', null: false, array: true, default: []
  end

  def down
    remove_column :base_slots, :user_tags
  end
end
