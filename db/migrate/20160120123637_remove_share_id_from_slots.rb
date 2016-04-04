class RemoveShareIdFromSlots < ActiveRecord::Migration
  def up
    remove_reference :base_slots, :shared_by, references: :users
    remove_column :global_slots, :shared_by_id
    remove_column :base_slots, :share_id
    remove_column :global_slots, :share_id
  end

  def down
    add_column :global_slots, :shared_by_id, :bigint
    add_column :base_slots, :shared_by_id, :bigint
    add_column :global_slots, :share_id, :string, limit: 8, default: ''
    add_column :base_slots, :share_id, :string, limit: 8, default: ''
  end
end
