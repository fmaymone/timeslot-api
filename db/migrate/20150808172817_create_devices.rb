class CreateDevices < ActiveRecord::Migration
  def up
    create_table :devices do |t|
      t.references :user, index: true
      t.string :device_id, limit: 128, null: false, unique: true
      t.string :system, limit: 8, null: false
      t.string :version, limit: 8, null: false
      t.string :token, limit: 128, unique: true
      t.string :endpoint, limit: 128, unique: true
      t.timestamps null: false
      t.timestamp :deleted_at
    end
    change_column :devices, :id, 'bigint'
    change_column :devices, :user_id, 'bigint'
    remove_column :users, :device_token
  end

  def down
    drop_table :devices
    add_column :users, :device_token, :string, limit: 128
  end
end
