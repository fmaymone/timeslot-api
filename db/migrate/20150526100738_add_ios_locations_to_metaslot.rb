class AddIosLocationsToMetaslot < ActiveRecord::Migration
  def change
    add_column :meta_slots, :ios_location_id, 'bigint'
    add_column :ios_locations, :auid, 'bigint'
    change_column_null(:ios_locations, :name, true)
    remove_index :ios_locations, column: [:name, :latitude, :longitude], unique: true
    add_index :ios_locations, [:latitude, :longitude], unique: true
    add_index :ios_locations, :auid, unique: true
  end
end
