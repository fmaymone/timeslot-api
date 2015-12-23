class ChangeMetaSlotLocationType < ActiveRecord::Migration
  def up
    remove_column :meta_slots, :location_id
    add_column :meta_slots, :location_uid, :uuid
  end

  def down
    remove_column :meta_slots, :location_uid
    add_column :meta_slots, :location_id, :bigint
  end
end
