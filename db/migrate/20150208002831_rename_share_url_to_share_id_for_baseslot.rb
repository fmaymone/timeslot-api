class RenameShareUrlToShareIdForBaseslot < ActiveRecord::Migration
  def up
    remove_column :base_slots, :share_url
    add_column :base_slots, :share_id, :string, limit: 8,  default: ''
  end

  def down
    add_column :base_slots, :share_url, :string, default: ''
    remove_column :base_slots, :share_id
  end
end
