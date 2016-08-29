class AddPlaceIdToLocation < ActiveRecord::Migration
  def change
    add_column :ios_locations, :place_id, :string
    add_index :ios_locations, :place_id, unique: true
    change_column_null :ios_locations, :uuid, false
  end
end
