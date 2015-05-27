class CreateIosLocations < ActiveRecord::Migration
  def up
    create_table :ios_locations do |t|
      t.string :name, limit: 128, null: false
      t.string :street, default: '', limit: 128
      t.string :city, default: '', limit: 128
      t.string :postcode, default: '', limit: 32
      t.string :country, default: '', limit: 64
      t.point :geo_position # latitude/longitude
      t.float :latitude
      t.float :longitude
      t.bigint :creator_id, null: false # reference to user
      t.boolean :private_location, default: true, null: false
      t.timestamps null: false
    end
    change_column :ios_locations, :id, 'bigint'
    add_index :ios_locations, [:name, :latitude, :longitude], unique: true
  end

  def down
    drop_table :ios_locations
  end
end
