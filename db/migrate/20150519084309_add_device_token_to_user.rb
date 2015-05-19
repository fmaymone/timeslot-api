class AddDeviceTokenToUser < ActiveRecord::Migration
  def change
    add_column(:users, :location_name, :string, limit: 128)
    add_column(:users, :device_token, :string, limit: 128)
    change_column_null(:users, :username, false)
    change_column_null(:users, :role, false)
    change_column_null(:users, :email_verified, false)
    change_column_null(:users, :phone_verified, false)
  end
end
