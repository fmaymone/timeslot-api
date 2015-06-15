class ChangeIosLocation < ActiveRecord::Migration
  # address dictionary properties
  # var name: String! { get } // eg. Apple Inc.
  # var thoroughfare: String! { get } // street address, eg. 1 Infinite Loop
  # var subThoroughfare: String! { get } // eg. 1
  # var locality: String! { get } // city, eg. Cupertino
  # var subLocality: String! { get } // neighborhood, common name, eg. Mission District
  # var administrativeArea: String! { get } // state, eg. CA
  # var subAdministrativeArea: String! { get } // county, eg. Santa Clara
  # var postalCode: String! { get } // zip code, eg. 95014
  # var ISOcountryCode: String! { get } // eg. US
  # var country: String! { get } // eg. United States
  # var inlandWater: String! { get } // eg. Lake Tahoe
  # var ocean: String! { get } // eg. Pacific Ocean
  # var areasOfInterest: [AnyObject]! { get } // eg. Golden Gate Park

  def up
    drop_table :ios_locations
    create_table :ios_locations do |t|
      t.string :name, limit: 255, default: ''
      t.string :thoroughfare, limit: 255
      t.string :sub_thoroughfare, limit: 255
      t.string :locality, limit: 255
      t.string :sub_locality, limit: 255
      t.string :administrative_area, limit: 255
      t.string :sub_administrative_area, limit: 255
      t.string :postal_code, limit: 32
      t.string :country, limit: 255
      t.string :iso_country_code, limit: 8
      t.string :in_land_water, limit: 255
      t.string :ocean, limit: 255
      t.string :areas_of_interest, limit: 255
      t.float :latitude
      t.float :longitude
      t.bigint :creator_id, null: false # reference to user
      t.boolean :private_location, default: false, null: false
      t.timestamps null: false
    end
    change_column :ios_locations, :id, 'bigint'
    add_index :ios_locations, [:name, :latitude, :longitude], unique: true
  end

  def down
    drop_table :ios_locations
    create_table :ios_locations do |t|
      t.string :name, limit: 128
      t.string :street, default: '', limit: 128
      t.string :city, default: '', limit: 128
      t.string :postcode, default: '', limit: 32
      t.string :country, default: '', limit: 64
      t.float :latitude
      t.float :longitude
      t.bigint :creator_id, null: false # reference to user
      t.boolean :private_location, default: true, null: false
      t.column :auid, 'bigint'
      t.timestamps null: false
    end
    change_column :ios_locations, :id, 'bigint'
    add_index :ios_locations, :auid, unique: true
    add_index :ios_locations, [:latitude, :longitude], unique: true
  end
end
