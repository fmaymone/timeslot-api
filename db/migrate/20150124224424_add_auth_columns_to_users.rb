class AddAuthColumnsToUsers < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|
      t.string :email, null: false, default: ""
      t.string :password_digest, null: false, default: ""
      t.string :auth_token
    end

    add_index :users, :email, unique: true
    add_index :users, :auth_token, unique: true
  end

  def self.down
    remove_index :users, :email
    remove_index :users, :auth_token
    remove_column :users, :email
    remove_column :users, :password_digest
    remove_column :users, :auth_token
  end
end
