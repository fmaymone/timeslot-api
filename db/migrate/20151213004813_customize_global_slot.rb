class CustomizeGlobalSlot < ActiveRecord::Migration
  def up
    change_table :global_slots do |t|
      t.uuid :muid, null: false
    end
    remove_column :global_slots, :crawler_id
    remove_column :global_slots, :cuid
    remove_column :global_slots, :duid
    change_column_null :global_slots, :url, true
  end

  def down
    change_table :global_slots do |t|
      t.uuid :cuid, null: false
      t.uuid :duid, null: false
    end
    remove_column :global_slots, :muid
    add_column :global_slots, :crawler_id, :bigint, null: false
    change_column_null :global_slots, :url, false
  end
end
