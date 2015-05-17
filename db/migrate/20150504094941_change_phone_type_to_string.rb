class ChangePhoneTypeToString < ActiveRecord::Migration
  def up
    change_column :users, :phone, :string, limit: 35
    add_column :users, :phone_verified, :boolean, default: false
    add_column :users, :email_verified, :boolean, default: false
    rename_column :connects, :social_data, :data
  end

  def down
    remove_column :users, :phone
    add_column :users, :phone, :integer
    remove_column :users, :phone_verified
    remove_column :users, :email_verified
    rename_column :connects, :data, :social_data
  end
end
