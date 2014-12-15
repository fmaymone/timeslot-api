class ChangeLocationIdTypeForMetaSlot < ActiveRecord::Migration
  def up
    remove_column :meta_slots, :location_id
    add_column :meta_slots, :location_id, :integer
  end

  def down
    remove_column :meta_slots, :location_id
    add_column :meta_slots, :location_id, :string
  end
end
