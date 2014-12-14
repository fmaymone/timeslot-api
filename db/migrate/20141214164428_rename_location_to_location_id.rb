class RenameLocationToLocationId < ActiveRecord::Migration
  def change
    rename_column :meta_slots, :location, :location_id
  end
end
