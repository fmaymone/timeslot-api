class AddDefaultsToUserColumns < ActiveRecord::Migration
  def up
    change_column :users, :email, :string, limit: 255
    change_column :users, :public_url, :string, limit: 255
    change_column :users, :lang, :string, limit: 8
    change_column_null :users, :push, false
  end

  def down
    change_column :users, :email, :string
    change_column :users, :public_url, :string
    change_column :users, :lang, :string
    change_column_null :users, :push, true
  end
end
