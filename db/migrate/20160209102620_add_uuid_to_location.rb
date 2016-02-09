class AddUuidToLocation < ActiveRecord::Migration
  def change
    enable_extension "uuid-ossp"
    add_column :ios_locations, :uuid, :uuid, null: false, default: 'uuid_generate_v4()'
  end
end
