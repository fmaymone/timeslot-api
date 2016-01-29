class RemoveShareIdFromSlots < ActiveRecord::Migration
  def up
    remove_reference :base_slots, :shared_by, references: :users
    remove_column :base_slots, :share_id
  end

  def down
    add_reference :base_slots, :shared_by, references: :users
    add_column :base_slots, :share_id, :string, limit: 8,  default: ''
  end
end
