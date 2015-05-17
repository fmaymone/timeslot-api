class AdjustUserTable < ActiveRecord::Migration
  def up
    change_column(:users, :username, :string, limit: 50)
    change_column(:users, :password_digest, :string, limit: 60)
    change_column(:users, :auth_token, :string, limit: 27)
    change_column(:users, :role, :integer, limit: 2)
    execute <<-SQL
      ALTER TABLE users
        ALTER COLUMN email DROP NOT NULL,
        ALTER COLUMN password_digest DROP DEFAULT;
    SQL
  end

  def down
    change_column(:users, :username, :string, limit: 20)
    change_column(:users, :password_digest, :string)
    change_column(:users, :auth_token, :string)
    change_column(:users, :role, :integer)
    change_column_null(:users, :email, false)
    change_column_default(:users, :password_digest, '')
  end
end
